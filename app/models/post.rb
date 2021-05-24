class Post < ApplicationRecord
    # Associations
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, -> { where(deleted: false) }
    
    has_one_attached :image
    
    # Validations
    validates :content, presence: true, length: { maximum: 140 }
end
