class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :diary

  validates :customer_id, uniqueness: {scope: :diary_id}
end
