defmodule Crosschallenge do
  alias Crosschallenge.Transform.SortingAllNumbers
  alias Crosschallenge.Record.CreateRecord

  def play do
    listofNumbers =
      SortingAllNumbers.sortingNumbers()
      |> CreateRecord.create_list()
  end
end
