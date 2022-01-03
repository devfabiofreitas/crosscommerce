defmodule Crosschallenge.NumberExtract.GetNumberAllPagesTest do
  use ExUnit.Case
  alias Crosschallenge.NumberExtract.GetNumberAllPages

  defp fetchPages(curr, list \\ []) do
    listControl = GetNumberAllPages.state(curr)

    case listControl do
      :finish ->
        list

      _ ->
        {_page, finallist} = listControl
        fetchPages(curr + 1, list ++ finallist)
    end
  end

  describe "state" do
    test "when page fetch return [], state return :finish" do
      expected = GetNumberAllPages.state(10001)
      response = :finish

      assert expected == response
    end
  end

  test "if parallel fetching build right list" do
    expected = Enum.take(Enum.sort(fetchPages(9961)), -1)
    response = Enum.take(Enum.sort(GetNumberAllPages.com(332, [])), -1)
    assert expected == response
  end
end
