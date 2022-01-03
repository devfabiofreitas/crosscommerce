defmodule CrosschallengeWeb.FallbackController do
  use CrosschallengeWeb, :controller

  alias CrosschallengeWeb.Error

  alias CrosschallengeWeb.ErrorView

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(CrosschallengeWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end
end
