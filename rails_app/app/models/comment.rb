class Comment < ApplicationRecord
  validates :message, :title, length: { maximum: 255 }
  validates :book_id, :user_id, uniqueness: true
end
