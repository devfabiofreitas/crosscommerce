defmodule Crosschallenge.Record.CreteRecordTest do
  use Crosschallenge.DataCase, async: true
  alias Crosschallenge.Record.CreateRecord
  alias Crosschallenge.Record.GetRecord

  test "create_list/1 test" do
    {:ok, expected} = CreateRecord.create_list([1, 2, 3])
    assert expected == GetRecord.get_list()
  end
end
