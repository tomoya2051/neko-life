class Admin::DiariesController < ApplicationController
  before_action :authenticate_admin!
  def index_diaries_user
    customer = Customer.find(params[:id])
    @diaries = customer.diaries
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_to admin_path
    # customer = Customer.find(params[:id])
    # redirect_to admin_index_diaries_user_path(customer.id)
  end
end