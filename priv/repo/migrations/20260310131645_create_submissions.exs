defmodule Aureon.Repo.Migrations.CreateSubmissions do
  use Ecto.Migration

  def change do
    create table(:submissions) do
      add :score, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :exam_id, references(:exams, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:submissions, [:user_id])
    create index(:submissions, [:exam_id])
  end
end
