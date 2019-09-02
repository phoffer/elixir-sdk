defmodule Procore.Resources.MakesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ManagedEquipment.Makes

  test "find/1" do
    client = Procore.client()
    params = %{"id" => 1, "company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Makes.find(client, params)
  end

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Makes.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{
      "company_id" => 1,
      "managed_equipment_make" => %{
        "name" => "CAT",
        "is_active" => true,
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Makes.create(client, params)
  end

  test "update/1" do
    client = Procore.client()
    params = %{
      "company_id" => 1,
      "managed_equipment_make" => %{
        "id" => 1,
        "name" => "CAT",
        "is_active" => false,
      }
    }

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Makes.update(client, params)
  end
end
