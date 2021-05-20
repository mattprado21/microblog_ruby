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
    
    # # Enums
    # enum gender: {male: 0, female: 1}
  
    # # validations
    # has_secure_password
  
    # validates :username, :email, :password, :first_name, :last_name, :gender, :birthdate, presence: true
    # validates :username, :email, uniqueness: true
    # validates :username, length: { in: 6..20 }
    # validates :first_name, :last_name, length: { in: 2..20 }
    # validates :email, format: { with: /\A.+@.+$\Z/ },
    # validates :password, length: { in: 6..20 }
    # validates :gender, inclusion: { in: gender.values }
    # validates :age_validator
    
    # def age_validator
    #   if birthdate.present? && birthdate > 18.years.ago.to_d
    #     errors.add(:birthdate, 'You should be over 18 years old.')
    #   end
    # end
  end
  