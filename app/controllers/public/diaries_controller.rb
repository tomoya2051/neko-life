class Public::DiariesController < ApplicationController
  def index
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.customer_id = current_customer.id
    @diary.save
    redirect_to diaries_path
  end

  def show
  end

  def edit
  end

  private
  def diary_params
    params.require(:diary).permit(:title, :body, :image)
  end
end
