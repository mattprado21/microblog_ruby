class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  # Validations
  validates :comment, presence: true, length: { maximum: 140 }
end
