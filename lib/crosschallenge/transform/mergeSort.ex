defmodule Crosschallenge.Transform.MergeSort do
  def sort([]), do: []
  def sort([_] = listNumbers), do: listNumbers

  def sort(listNumbers) do
    tam = length(listNumbers)
    {re, dru} = Enum.split(listNumbers, div(tam, 2))
    re = sort(re)
    dru = sort(dru)
    merge(re, dru, [])
  end

  defp merge([], dru, acc), do: Enum.reverse(acc) ++ dru
  defp merge(re, [], acc), do: Enum.reverse(acc) ++ re

  defp merge([re_head | re_tail] = re, [dru_head | dru_tail] = dru, acc) do
    if re_head <= dru_head do
      merge(re_tail, dru, [re_head | acc])
    else
      merge(re, dru_tail, [dru_head | acc])
    end
  end
end
