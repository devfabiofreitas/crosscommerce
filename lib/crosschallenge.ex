defmodule Crosschallenge do
  alias Crosschallenge.Transform.SortingAllNumbers
  alias Crosschallenge.Record.CreateRecord

  def play do
    list_of_numbers =
      SortingAllNumbers.sorting_numbers()
      |> CreateRecord.create_list()
  end
end
