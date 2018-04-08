defmodule Tesla.Middleware.RetryBackoff do
  alias Procore.ErrorResult
  alias Procore.ResponseResult

  @defaults [
    delay: 500,
    max_retries: 5
  ]

  def call(env, next, opts \\ []) do
    delay = Keyword.get(opts, :delay, @defaults[:delay])
    max_retries = Keyword.get(opts, :max_retries, @defaults[:max_retries])

    retry(env, next, delay, max_retries, max_retries)
  end

  defp retry(env, next, _delay, retries, _max_retries) when retries == 1 do
    Tesla.run(env, next)
  end

  defp retry(env, next, _delay, retries, _max_retries) when retries == 0 do
    case Tesla.run(env, next) do
      %ResponseResult{} = response_result ->
        response_result

      {:error, reason} ->
        %ErrorResult{reply: :error, reason: reason}
    end
  end

  defp retry(env, next, delay, retries, max_retries) do
    case Tesla.run(env, next) do
      %ResponseResult{} = response_result ->
        response_result

      {:error, _reason} ->
        backoff(delay, retries, max_retries)
        |> trunc()
        |> :timer.sleep()

        retry(env, next, delay, (retries - 1), max_retries)
    end
  end

  defp backoff(delay, retries, max_retries) do
    :math.pow(delay, (max_retries - retries))
  end
end
