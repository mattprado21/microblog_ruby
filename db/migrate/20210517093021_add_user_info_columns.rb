class AddUserInfoColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :birthdate, :date
    add_column :users, :bio, :string
  end
end
