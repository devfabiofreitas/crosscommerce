defmodule Crosschallenge.Repo.Migrations.CreateListOfNumbers do
  use Ecto.Migration

  def change do
    create table(:list) do
      add :list, {:array, :float}

      timestamps()
    end
  end
end
