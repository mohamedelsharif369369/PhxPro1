defmodule Aureon.Exams.Option do
  use Ecto.Schema
  import Ecto.Changeset

  schema "options" do
    field :text, :string
    field :correct, :boolean, default: false
    belongs_to :question, Aureon.Exams.Question

    timestamps()
  end

  def changeset(option, attrs) do
    option
    |> cast(attrs, [:text, :correct, :question_id])
    |> validate_required([:text, :question_id])
  end
end
