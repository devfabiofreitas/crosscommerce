defmodule CrosschallengeWeb.NumbersView do
  use CrosschallengeWeb, :view

  def render("numbers.json", %{numbers: list}) do
    %{numbers: list}
  end
end
