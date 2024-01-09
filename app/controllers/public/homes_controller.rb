class Public::HomesController < ApplicationController
  def top
    @diaries=Diary.all.order(created_at: :desc).limit(4)
  end
  
  def about
  end
end
