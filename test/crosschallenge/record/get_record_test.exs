defmodule Crosschallenge.Record.GetRecordTest do
  use Crosschallenge.DataCase, async: true
  alias Crosschallenge.Record.CreateRecord
  alias Crosschallenge.Record.GetRecord

  test "get_list/1 returns to saved list " do
    {:ok, expected} = CreateRecord.create_list([1, 2, 3])
    assert expected == GetRecord.get_list()
  end
end
