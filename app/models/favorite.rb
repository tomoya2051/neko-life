class Favorite < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :diary

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  validates :customer_id, uniqueness: {scope: :diary_id}
end
