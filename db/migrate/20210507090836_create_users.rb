class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :email_verification_token
      t.boolean :is_verified, :default => false
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthdate
      t.string :address
      t.string :bio
      t.string :profile_image
      t.datetime :created
      t.datetime :modified
    end
  end
end