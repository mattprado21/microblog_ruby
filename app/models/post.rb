class Post < ApplicationRecord
    # Associations
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, -> { where(deleted: false) }
    # has_many :retweeter, :class_name => "user"
    
    belongs_to :share, :class_name => "Post", :foreign_key => "post_id"
    # has_many :share, :class_name => "Post", :foreign_key => "post_id"
    has_one_attached :image

    # Pagination
    self.per_page = 5

    def self.search(search)
        # Title is for the above case, the OP incorrectly had 'name'
        where("content LIKE ?", "%#{search}%")
    end

    # Validations
    validates :content, presence: true, length: { maximum: 140 }
end
