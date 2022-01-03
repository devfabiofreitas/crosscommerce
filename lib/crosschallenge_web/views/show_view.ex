defmodule CrosschallengeWeb.ShowView do
  use CrosschallengeWeb, :view

  def render("showall.json", %{allnumbers: list}) do
    %{allnumbers: list}
  end
end
