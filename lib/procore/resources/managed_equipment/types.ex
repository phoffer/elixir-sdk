defmodule Procore.Resources.ManagedEquipment.Types do
  @moduledoc """
  Available actions for the Equipment Types resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists the Equipment Types for a Company.
  """
  @spec list(Tesla.Client.t(), %{(company_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/managed_equipment_types")
    |> Request.insert_query_params(params)
    |> Procore.send_request(client)
  end

  @doc """
  Gets an Equipment Type.
  """
  @spec find(Tesla.Client.t(), map) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"company_id" => company_id, "id" => id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/managed_equipment_types/#{id}")
    |> Procore.send_request(client)
  end

  @doc """
  Deletes an Equipment Type for a Company.
  """
  @spec delete(Tesla.Client.t(), %{(company_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def delete(client, %{"company_id" => company_id, "id" => id} = params) do
    %Request{}
    |> Request.insert_request_type(:delete)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/managed_equipment_types/#{id}")
    |> Procore.send_request(client)
  end

  @doc """
  Creates an Equipment Type.
  """
  @spec create(Tesla.Client.t(), map) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"company_id" => company_id, "managed_equipment_type" => managed_equipment_type} = params) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/managed_equipment_types")
    |> Request.insert_body(%{"managed_equipment_type" => managed_equipment_type})
    |> Procore.send_request(client)
  end

  @doc """
  Updates an Equipment Type.
  """
  @spec update(Tesla.Client.t(), map) :: %ResponseResult{} | %ErrorResult{}
  def update(client, %{"company_id" => company_id, "managed_equipment_type" => %{"id" => id} = managed_equipment_type} = params) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/managed_equipment_types/#{id}")
    |> Request.insert_body(%{"managed_equipment_type" => managed_equipment_type})
    |> Procore.send_request(client)
  end


end
