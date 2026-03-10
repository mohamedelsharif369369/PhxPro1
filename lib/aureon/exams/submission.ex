defmodule Aureon.Exams.Submission do
  use Ecto.Schema
  import Ecto.Changeset

  schema "submissions" do
    field :score, :integer, default: 0
    belongs_to :exam, Aureon.Exams.Exam
    #belongs_to :user, Aureon.Accounts.User

    timestamps()
  end

  def changeset(submission, attrs) do
    submission
    |> cast(attrs, [:score, :exam_id, :user_id])
    |> validate_required([:exam_id, :user_id])
  end
end
