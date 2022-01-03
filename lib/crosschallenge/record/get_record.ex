defmodule Crosschallenge.Record.GetRecord do
  import Ecto.Query, warn: false
  alias Crosschallenge.Repo
  alias Crosschallenge.Record

  def get_list do
    Repo.one(from n in Record, order_by: [desc: n.id], limit: 1)
  end
end
