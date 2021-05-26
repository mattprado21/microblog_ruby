class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :confirmable

    # Associations
    has_many :posts
    has_many :likes, dependent: :destroy
    has_many :comments
    has_one_attached :profile_image
    after_commit :add_default_avatar, on: %i[create update]
    
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

    def age_validator
      if birthdate.present? && birthdate > 18.years.ago.to_date
        errors.add(:birthdate, 'You should be over 18 years old.')
      end
    end
    
    private
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
  