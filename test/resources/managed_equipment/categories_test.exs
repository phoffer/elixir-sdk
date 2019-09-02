defmodule Procore.Resources.CategoriesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ManagedEquipment.Categories

  test "find/1" do
    client = Procore.client()
    params = %{"id" => 1, "company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Categories.find(client, params)
  end

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Categories.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{
      "company_id" => 1,
      "managed_equipment_category" => %{
        "name" => "Earthmoving",
        "is_active" => true,
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Categories.create(client, params)
  end

  test "update/1" do
    client = Procore.client()
    params = %{
      "company_id" => 1,
      "managed_equipment_category" => %{
        "id" => 1,
        "name" => "Earthmoving",
        "is_active" => false,
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Categories.update(client, params)
  end
end
