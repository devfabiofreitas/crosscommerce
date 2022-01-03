defmodule CrosschallengeWeb.ShowController do
  use CrosschallengeWeb, :controller

  alias Crosschallenge.Record.GetRecord
  alias Crosschallenge.Record
  alias CrosschallengeWeb.FallbackController

  action_fallback FallbackController

  def control_Show(conn, page) do
    case GetRecord.get_list() do
      %Record{list: num} ->
        render(conn, "showall.json", allnumbers: num)
      nil ->  render(conn, "showall.json", allnumbers: [])
    end
  end

  def resq(conn, _) do
    control_Show(conn, 1)
  end
end
