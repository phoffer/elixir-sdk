defmodule Procore.Resources.ModelsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ManagedEquipment.Models

  test "find/1" do
    client = Procore.client()
    params = %{"id" => 1, "company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Models.find(client, params)
  end

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Models.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{
      "company_id" => 1,
      "managed_equipment_model" => %{
        "name" => "CAT-BH-123",
        "managed_equipment_make_id" => 1,
        "managed_equipment_type_id" => 1,
        "is_active" => true,
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Models.create(client, params)
  end

  test "update/1" do
    client = Procore.client()
    params = %{
      "company_id" => 1,
      "managed_equipment_model" => %{
        "id" => 1,
        "name" => "CAT-BH-123",
        "managed_equipment_make_id" => 1,
        "managed_equipment_type_id" => 1,
        "is_active" => false,
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Models.update(client, params)
  end
end
