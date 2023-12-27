class Public::AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    question = Question.find(params[:question_id])
    comment = current_customer.answers.new(answer_params)
    comment.question_id = question.id
    comment.save
    redirect_to question_path(question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :image)
  end
end
