defmodule Crosschallenge.Transform.SortingAllNumbers do
  alias Crosschallenge.NumberExtract.GetNumberAllPages
  alias Crosschallenge.Transform.MergeSort

  def sorting_numbers do
    ord =
      GetNumberAllPages.com_fetch()
      |> MergeSort.sort()

    ord
  end
end
