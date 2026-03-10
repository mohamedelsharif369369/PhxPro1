defmodule Aureon.ExamsTest do
  use Aureon.DataCase

  alias Aureon.Exams

  describe "exams" do
    alias Aureon.Exams.Exam

    import Aureon.ExamsFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_exams/0 returns all exams" do
      exam = exam_fixture()
      assert Exams.list_exams() == [exam]
    end

    test "get_exam!/1 returns the exam with given id" do
      exam = exam_fixture()
      assert Exams.get_exam!(exam.id) == exam
    end

    test "create_exam/1 with valid data creates a exam" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Exam{} = exam} = Exams.create_exam(valid_attrs)
      assert exam.description == "some description"
      assert exam.title == "some title"
    end

    test "create_exam/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exams.create_exam(@invalid_attrs)
    end

    test "update_exam/2 with valid data updates the exam" do
      exam = exam_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Exam{} = exam} = Exams.update_exam(exam, update_attrs)
      assert exam.description == "some updated description"
      assert exam.title == "some updated title"
    end

    test "update_exam/2 with invalid data returns error changeset" do
      exam = exam_fixture()
      assert {:error, %Ecto.Changeset{}} = Exams.update_exam(exam, @invalid_attrs)
      assert exam == Exams.get_exam!(exam.id)
    end

    test "delete_exam/1 deletes the exam" do
      exam = exam_fixture()
      assert {:ok, %Exam{}} = Exams.delete_exam(exam)
      assert_raise Ecto.NoResultsError, fn -> Exams.get_exam!(exam.id) end
    end

    test "change_exam/1 returns a exam changeset" do
      exam = exam_fixture()
      assert %Ecto.Changeset{} = Exams.change_exam(exam)
    end
  end

  describe "submissions" do
    alias Aureon.Exams.Submission

    import Aureon.ExamsFixtures

    @invalid_attrs %{score: nil}

    test "list_submissions/0 returns all submissions" do
      submission = submission_fixture()
      assert Exams.list_submissions() == [submission]
    end

    test "get_submission!/1 returns the submission with given id" do
      submission = submission_fixture()
      assert Exams.get_submission!(submission.id) == submission
    end

    test "create_submission/1 with valid data creates a submission" do
      valid_attrs = %{score: 42}

      assert {:ok, %Submission{} = submission} = Exams.create_submission(valid_attrs)
      assert submission.score == 42
    end

    test "create_submission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exams.create_submission(@invalid_attrs)
    end

    test "update_submission/2 with valid data updates the submission" do
      submission = submission_fixture()
      update_attrs = %{score: 43}

      assert {:ok, %Submission{} = submission} = Exams.update_submission(submission, update_attrs)
      assert submission.score == 43
    end

    test "update_submission/2 with invalid data returns error changeset" do
      submission = submission_fixture()
      assert {:error, %Ecto.Changeset{}} = Exams.update_submission(submission, @invalid_attrs)
      assert submission == Exams.get_submission!(submission.id)
    end

    test "delete_submission/1 deletes the submission" do
      submission = submission_fixture()
      assert {:ok, %Submission{}} = Exams.delete_submission(submission)
      assert_raise Ecto.NoResultsError, fn -> Exams.get_submission!(submission.id) end
    end

    test "change_submission/1 returns a submission changeset" do
      submission = submission_fixture()
      assert %Ecto.Changeset{} = Exams.change_submission(submission)
    end
  end
end
