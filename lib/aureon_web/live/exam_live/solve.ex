defmodule AureonWeb.ExamLive.Solve do
  use AureonWeb, :live_view

  alias Aureon.Exams

  def mount(%{"exam_id" => exam_id}, _session, socket) do
    exam = Exams.get_exam!(exam_id)
    questions = Exams.list_questions(exam_id)
    {:ok, assign(socket, exam: exam, questions: questions, answers: %{}, score: nil)}
  end

  def handle_event("submit_answer", %{"question_id" => qid, "answer" => ans}, socket) do
    answers = Map.put(socket.assigns.answers, qid, ans)
    {:noreply, assign(socket, answers: answers)}
  end

  def handle_event("finish_exam", _params, socket) do
    score = Exams.calculate_score(socket.assigns.exam.id, socket.assigns.answers)
    {:noreply, assign(socket, score: score)}
  end
end
