defmodule Aureon.Exams do
  @moduledoc """
  Context module for managing Exams, Questions, and Submissions.
  """

  import Ecto.Query, warn: false
  alias Aureon.Repo

  alias Aureon.Exams.{Exam, Question, Option, Submission}

  ## ------------------------
  ## Exams
  ## ------------------------
  def list_exams do
    Repo.all(Exam)
  end

  def get_exam!(id) do
    Repo.get!(Exam, id)
  end

  def create_exam(attrs \\ %{}) do
    %Exam{}
    |> Exam.changeset(attrs)
    |> Repo.insert()
  end

  def update_exam(%Exam{} = exam, attrs) do
    exam
    |> Exam.changeset(attrs)
    |> Repo.update()
  end

  def delete_exam(%Exam{} = exam) do
    Repo.delete(exam)
  end

  ## ------------------------
  ## Questions
  ## ------------------------
  def list_questions(exam_id) do
    Repo.all(
      from q in Question,
        where: q.exam_id == ^exam_id,
        preload: [:options]
    )
  end

  def get_question!(id) do
    Repo.get!(Question, id)
  end

  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  ## ------------------------
  ## Options (for multiple-choice)
  ## ------------------------
  def create_option(attrs \\ %{}) do
    %Option{}
    |> Option.changeset(attrs)
    |> Repo.insert()
  end

  ## ------------------------
  ## Submissions
  ## ------------------------
  def submit_exam(exam_id, user_id, answers) do
    %Submission{}
    |> Submission.changeset(%{
      exam_id: exam_id,
      user_id: user_id,
      answers: answers,
      score: calculate_score(exam_id, answers)
    })
    |> Repo.insert()
  end

  ## ------------------------
  ## Scoring
  ## ------------------------
  def calculate_score(exam_id, answers) do
    questions = list_questions(exam_id)

    Enum.reduce(questions, 0, fn question, acc ->
      correct_option = Enum.find(question.options, & &1.correct)

      if correct_option && Map.get(answers, question.id) == correct_option.id do
        acc + 1
      else
        acc
      end
    end)
  end
end
