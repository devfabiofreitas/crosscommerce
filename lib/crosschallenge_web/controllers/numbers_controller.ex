defmodule CrosschallengeWeb.NumbersController do
  use CrosschallengeWeb, :controller

  alias Crosschallenge.Record.GetRecord
  alias Crosschallenge.Record
  alias CrosschallengeWeb.FallbackController

  action_fallback FallbackController

  def control_show(conn, page) do
    case GetRecord.get_list() do
      nil ->
        render(conn, "numbers.json", numbers: [])

      %Record{list: num} ->
        render(conn, "numbers.json",
          numbers:
            num
            |> Stream.chunk_every(100)
            |> Enum.at(page - 1, [])
        )
    end
  end

  def index(conn, %{"page" => page}) do
    case Integer.parse(page) do
      :error ->
        errore = conn |> json(%{error: "Page must be integer"}) |> put_status(400) |> halt()
        errore

      {page, _} ->
        if page > 0 do
          control_show(conn, page)
        else
          render(conn, "numbers.json", numbers: nil)
        end
    end
  end

  def index(conn, _) do
    control_show(conn, 1)
  end
end
