class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :confirmable

    # Associations
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments
    has_one_attached :profile_image
    after_commit :add_default_avatar, on: %i[create update]
    has_many :active_relationships, class_name: "Relationship",
      foreign_key: "follower_id",
      dependent: :destroy
    has_many :passive_relationships, class_name: "Relationship",
      foreign_key: "followed_id",
      dependent: :destroy
      
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower
    
    def profile_image_thumbnail
      if profile_image.attached?
        profile_image.variant(resize: "500x500!").processed
      else
        "default_profile.jpg"
      end
    end

    # # Enums
    # enum gender: {male: 0, female: 1}
  
    # validations
    validates :first_name, :last_name, presence: true
    validates :first_name, :last_name, length: { in: 2..20 }

    # has_secure_password
    # validates :username, :email, :password, :first_name, :last_name, :gender, :birthdate, presence: true
    # validates :username, :email, uniqueness: true
    # validates :username, length: { in: 6..20 }
    # validates :first_name, :last_name, length: { in: 2..20 }
    # validates :email, format: { with: /\A.+@.+$\Z/ },
    # validates :password, length: { in: 6..20 }
    # validates :gender, inclusion: { in: gender.values }
    validate :age_validator

    # Pagination
    self.per_page = 5
    
    def self.search(search)
      # Title is for the above case, the OP incorrectly had 'name'
      where("first_name LIKE ? OR last_name LIKE ?", "%#{search}%", "%#{search}%")
    end

    # Follows a user.
    def follow(other_user)
      following << other_user
    end
    # Unfollows a user.
    def unfollow(other_user)
      following.delete(other_user)
    end
      # Returns true if the current user is following the otheruser.
    def following?(other_user)
      following.include?(other_user)
    end


    private

    def age_validator
      if birthdate.present? && birthdate > 18.years.ago.to_date
        errors.add(:birthdate, 'You should be over 18 years old.')
      end
    end
    
    def add_default_avatar
      unless profile_image.attached?
        profile_image.attach(
          io: File.open(
            Rails.root.join(
              'app', 'assets', 'images', 'default_profile.jpg'
            )
          ),
          filename: 'default_profile.jpg',
          content_type: 'image/jpg'
        )
      end
    end
  end
  