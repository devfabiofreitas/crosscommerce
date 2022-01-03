defmodule CrosschallengeWeb.NumbersViewTest do
  use Crosschallenge.DataCase
  import Phoenix.View
  alias CrosschallengeWeb.NumbersView
  alias CrosschallengeWeb.Controller.NumbersController

  test "renders numbers.json" do
    %{numbers: response} = NumbersView.render("numbers.json", %{numbers: [1, 2, 3, 4, 5]})
    assert [1, 2, 3, 4, 5] == response
  end
end
