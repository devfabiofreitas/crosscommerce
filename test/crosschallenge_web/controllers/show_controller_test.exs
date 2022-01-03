defmodule CrosschallengeWeb.ShowControllerTest do 
    alias CrosschallengeWeb.ShowController
    alias Crosschallenge.Record.CreateRecord
    use CrosschallengeWeb.ConnCase, async: true


  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

   describe "resq" do
    test "show numbers", %{conn: conn} do
      conn = get(conn, Routes.show_path(conn, :resq))
      assert json_response(conn, 200)["allnumbers"] == []
    end

    test "show get numbers", %{conn: conn} do
      {:ok, list} = CreateRecord.create_list(Enum.sort(Enum.shuffle(1..200)))

      conn = get(conn, Routes.show_path(conn, :resq))
      assert json_response(conn, 200)["allnumbers"] == Enum.sort(Enum.shuffle(1..200))
     end
end
end