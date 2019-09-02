defmodule Procore.Resources.TypesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ManagedEquipment.Types

  test "find/1" do
    client = Procore.client()
    params = %{"id" => 1, "company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Types.find(client, params)
  end

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Types.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{
      "company_id" => 1,
      "managed_equipment_type" => %{
        "name" => "CAT",
        "managed_equipment_category" => 1,
        "is_active" => true,
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Types.create(client, params)
  end

  test "update/1" do
    client = Procore.client()
    params = %{
      "company_id" => 1,
      "managed_equipment_type" => %{
        "id" => 1,
        "name" => "CAT",
        "managed_equipment_category" => 1,
        "is_active" => false,
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Types.update(client, params)
  end
end
