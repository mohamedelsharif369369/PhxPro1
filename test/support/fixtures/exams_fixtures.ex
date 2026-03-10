defmodule Aureon.ExamsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Aureon.Exams` context.
  """

  @doc """
  Generate a exam.
  """
  def exam_fixture(attrs \\ %{}) do
    {:ok, exam} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Aureon.Exams.create_exam()

    exam
  end

  @doc """
  Generate a submission.
  """
  def submission_fixture(attrs \\ %{}) do
    {:ok, submission} =
      attrs
      |> Enum.into(%{
        score: 42
      })
      |> Aureon.Exams.create_submission()

    submission
  end
end
