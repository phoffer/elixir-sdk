defmodule Procore.Resources.ManagedEquipment.Categories do
  @moduledoc """
  Available actions for the Equipment Category resource.
  https://developers.procore.com/reference/equipment-category
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists the Equipment Categories for a Company.
  """
  @spec list(Tesla.Client.t(), %{(company_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"company_id" => company_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/managed_equipment_categories")
    |> Request.insert_query_params(params)
    |> Procore.send_request(client)
  end

  @doc """
  Gets an Equipment Category.
  """
  @spec find(Tesla.Client.t(), map) :: %ResponseResult{} | %ErrorResult{}
  def find(client, %{"company_id" => company_id, "id" => category_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/managed_equipment_categories/#{category_id}")
    |> Procore.send_request(client)
  end

  @doc """
  Deletes an Equipment Category for a Company.
  """
  @spec delete(Tesla.Client.t(), %{(company_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def delete(client, %{"company_id" => company_id, "id" => id} = params) do
    %Request{}
    |> Request.insert_request_type(:delete)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/managed_equipment_categories/#{id}")
    |> Procore.send_request(client)
  end

  @doc """
  Creates an Equipment Category.
  """
  @spec create(Tesla.Client.t(), map) :: %ResponseResult{} | %ErrorResult{}
  def create(client, %{"company_id" => company_id, "managed_equipment_category" => managed_equipment_category} = params) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/managed_equipment_categories")
    |> Request.insert_body(%{"managed_equipment_category" => managed_equipment_category})
    |> Procore.send_request(client)
  end

  @doc """
  Updates an Equipment Category.
  """
  @spec update(Tesla.Client.t(), map) :: %ResponseResult{} | %ErrorResult{}
  def update(client, %{"company_id" => company_id, "managed_equipment_category" => %{"id" => id} = managed_equipment_category} = params) do
    %Request{}
    |> Request.insert_request_type(:patch)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/managed_equipment_categories/#{id}")
    |> Request.insert_body(%{"managed_equipment_category" => managed_equipment_category})
    |> Procore.send_request(client)
  end


end
