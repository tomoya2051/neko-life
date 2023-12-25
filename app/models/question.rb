class Question < ApplicationRecord
  has_one_attached :image

  enum category: {
    breeding: 0,
    disease: 1,
    health: 2,
    ecology: 3,
    etcetera: 4
    }
end
