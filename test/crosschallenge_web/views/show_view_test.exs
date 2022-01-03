defmodule CrosschallengeWeb.ShowViewTest do
  use Crosschallenge.DataCase
  import Phoenix.View
  alias CrosschallengeWeb.ShowView

  test "renders numbers.json" do
    %{allnumbers: response} = ShowView.render("showall.json", %{allnumbers: [1, 2, 3, 4, 5]})
    assert [1, 2, 3, 4, 5] == response
  end
end
