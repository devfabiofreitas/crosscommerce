defmodule CrosschallengeWeb.NumbersControllerTest do
  alias CrosschallengeWeb.NumbersController
  alias Crosschallenge.Record.CreateRecord
  use CrosschallengeWeb.ConnCase, async: true

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "show numbers", %{conn: conn} do
      conn = get(conn, Routes.numbers_path(conn, :index))
      assert json_response(conn, 200)["numbers"] == []
    end

    test "return nill if numbers is not positive", %{conn: conn} do
      conn = get(conn, Routes.numbers_path(conn, :index, page: -2))
      assert json_response(conn, 200)["numbers"] == nil
    end

    test "numbers per page is correct", %{conn: conn} do
      {:ok, list} = CreateRecord.create_list(Enum.sort(Enum.shuffle(1..200)))

      conn = get(conn, Routes.numbers_path(conn, :index), page: 1)
      assert json_response(conn, 200)["numbers"] == Enum.sort(Enum.shuffle(1..100))
    end
  end
end
