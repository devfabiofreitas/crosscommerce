defmodule Crosschallenge.Transform.SortingAllNumbers do
  alias Crosschallenge.NumberExtract.GetNumberAllPages
  alias Crosschallenge.Transform.MergeSort

  def sortingNumbers do
    ord =
      GetNumberAllPages.com()
      |> MergeSort.sort()

    ord
  end
end
