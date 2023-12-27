class Question < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  has_many :answers, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category", "title", "body"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["answers", "customer", "image_attachment", "image_blob"]
  end
end
