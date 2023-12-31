class Public::FavoritesController < ApplicationController

  def create
    diary = Diary.find(params[:diary_id])
    favorite = current_customer.favorites.new(diary_id: diary.id)
    favorite.save
    redirect_to diary_path(diary)
  end

  def destroy
    diary = Diary.find(params[:diary_id])
    favorite = current_customer.favorites.find_by(diary_id: diary.id)
    favorite.destroy
    redirect_to diary_path(diary)
  end
end
