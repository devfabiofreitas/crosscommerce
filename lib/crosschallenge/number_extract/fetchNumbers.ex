defmodule Crosschallenge.NumberExtract.FetchNumbers do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://challenge.dienekes.com.br"
  plug Tesla.Middleware.JSON

  def fetch(page) do
    {:ok, response} = get("/api/numbers", query: [page: page])
    {page, response.body["numbers"]}
  end
end
