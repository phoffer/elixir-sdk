defmodule Procore.Resources.EquipmentTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ManagedEquipment.Equipment

  test "find/1" do
    client = Procore.client()
    params = %{"id" => 1, "company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Equipment.find(client, params)
  end

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Equipment.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{
      "company_id" => 1,
      "managed_equipment" => %{
        "name": "Backhoe",
        "current_project_id": 1,
        "company_visible": false,
        "serial_number": "S#12892",
        "identification_number": "ID#9018290",
        "description": "This equipment was brought in for the backyard work.",
        "managed_equipment_make_id": 14,
        "managed_equipment_model_id": 13,
        "managed_equipment_type_id": 132,
        "managed_equipment_category_id": 13,
        "year": 2017,
        "status": "in_use",
        "ownership": "owned",
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Equipment.create(client, params)
  end

  test "update/1" do
    client = Procore.client()
    params = %{
      "company_id" => 1,
      "managed_equipment" => %{
        "id" => 1,
        "company_visible": true,
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Equipment.update(client, params)
  end
end
