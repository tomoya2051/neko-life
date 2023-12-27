class Diary < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  has_many :diary_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "customer_id", "id", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["customer", "diary_comments", "favorites", "image_attachment", "image_blob"]
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
