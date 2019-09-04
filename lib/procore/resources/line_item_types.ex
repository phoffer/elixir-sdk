defmodule Procore.Resources.LineItemTypes do
  @moduledoc """
  Available actions for the Line Item Type resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists the Line Item Types for a Project.
  """
  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/line_item_types")
    |> Request.insert_query_params(params)
    |> Procore.send_request(client)
  end

  @spec list(Tesla.Client.t(), %{(company_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => _company_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/line_item_types")
    |> Request.insert_query_params(params)
    |> Procore.send_request(client)
  end

  @doc """
  Gets a Line Item Type for a Project.
  """
  @spec find(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"project_id" => project_id, "id" => id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/line_item_types/#{id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request(client)
  end

  @doc """
  Gets a Line Item Type for a company..
  """
  @spec find(Tesla.Client.t(), %{
          (company_id :: String.t()) => pos_integer,
          (id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"company_id" => company_id, "id" => id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/line_item_types/#{id}")
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request(client)
  end

  @doc """
  Creates a Line Item Type for a company.
  """
  @spec create(Tesla.Client.t(), %{
          (project_id :: String.t()) => pos_integer,
          (line_item_type :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"company_id" => _company_id, "line_item_type" => _line_item_type} = params) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/line_item_types")
    |> Request.insert_body(params)
    |> Procore.send_request(client)
  end

  @doc """
  Updates a Line Item Type for a Project.
  """
  @spec update(Tesla.Client.t(), %{
          (company_id :: String.t()) => pos_integer, (line_item_type :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def update(client, %{"company_id" => _company_id, "line_item_type" => %{"id" => id}} = params) do %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vapid/line_item_types/#{id}")
    |> Request.insert_body(params)
    |> Procore.send_request(client)
  end
end
