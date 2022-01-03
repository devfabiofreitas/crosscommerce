defmodule Crosschallenge.NumberExtract.GetNumberAllPagesTest do
  use ExUnit.Case
  alias Crosschallenge.NumberExtract.GetNumberAllPages

  defp fetch_pages(curr, list \\ []) do
    list_control = GetNumberAllPages.state(curr)

    case list_control do
      :finish ->
        list

      _ ->
        {_page, finallist} = list_control
        fetch_pages(curr + 1, list ++ finallist)
    end
  end

  describe "state" do
    test "when page fetch return [], state return :finish" do
      expected = GetNumberAllPages.state(10_001)
      response = :finish

      assert expected == response
    end
  end

  test "if parallel fetching build right list" do
    expected = Enum.take(Enum.sort(fetch_pages(9961)), -1)
    response = Enum.take(Enum.sort(GetNumberAllPages.com_fetch(332, [])), -1)
    assert expected == response
  end
end
