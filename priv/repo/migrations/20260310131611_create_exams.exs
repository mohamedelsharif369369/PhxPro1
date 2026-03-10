defmodule Aureon.Repo.Migrations.CreateExams do
  use Ecto.Migration

  def change do
    create table(:exams) do
      add :title, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
