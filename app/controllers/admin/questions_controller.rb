class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  def index_questions_user
    customer = Customer.find(params[:id])
    @questions = customer.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to admin_path
  end
end
