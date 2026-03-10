defmodule Aureon.Exams.Exam do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exams" do
    field :title, :string
    field :description, :string
    has_many :questions, Aureon.Exams.Question

    timestamps()
  end

  def changeset(exam, attrs) do
    exam
    |> cast(attrs, [:title, :description])
    |> validate_required([:title])
  end
end
