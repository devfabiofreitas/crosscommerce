defmodule Crosschallenge.NumberExtract.GetNumberAllPages do
  alias Crosschallenge.NumberExtract.FetchNumbers

  def com(current, list) when current > 1 do
    controlList =
      enumerable =
      ((current - 1) * 30 + 1)..(current * 30)
      |> Task.async_stream(fn x -> state(x) end,
        ordered: false,
        max_concurrency: System.schedulers_online() * 5
      )
      |> Enum.reduce([], fn
        {:ok, {_page, numbers}}, acc -> numbers ++ acc
        {:ok, :finish}, acc -> [] ++ acc
      end)

    case state(current * 30) do
      :finish ->
        list ++ controlList

      _ ->
        com(current + 1, controlList ++ list)
    end
  end

  def com(current \\ 1, list \\ []) when current == 1 do
    list =
      Task.async_stream(current..30, fn x -> state(x) end,
        ordered: false,
        max_concurrency: System.schedulers_online() * 5
      )
      |> Enum.reduce([], fn {:ok, {_page, numbers}}, acc -> numbers ++ acc end)

    com(current + 1, list)
  end

  def state(curr) do
    result = FetchNumbers.fetch(curr)

    case result do
      {_page, []} ->
        :finish

      {curr, nil} ->
        state(curr)

      {_page, numbers} ->
        result
    end
  end
end
