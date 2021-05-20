class Post < ApplicationRecord
    # Associations
    belongs_to :user
    has_many :likes, dependent: :destroy
    
    # Validations
    validates :content, presence: true, length: { maximum: 140 }
end
