class Public::QuestionsController < ApplicationController
  def index
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
  end

  private
  def question_params
    params.require(:question).permit(:title, :body, :image)
  end
end
