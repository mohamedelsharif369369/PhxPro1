defmodule Aureon.Exams.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :title, :string
    field :points, :integer, default: 1
    belongs_to :exam, Aureon.Exams.Exam
    has_many :options, Aureon.Exams.Option

    timestamps()
  end

  def changeset(question, attrs) do
    question
    |> cast(attrs, [:title, :points, :exam_id])
    |> validate_required([:title, :exam_id])
  end
end
