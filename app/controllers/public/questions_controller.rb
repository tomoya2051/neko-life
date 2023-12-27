class Public::QuestionsController < ApplicationController
  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.customer_id = current_customer.id
    @question.save
    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  private
  def question_params
    params.require(:question).permit(:title, :body, :image, :customer_id)
  end
end
