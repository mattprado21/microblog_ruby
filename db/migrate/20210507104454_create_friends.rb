class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.integer :followed_user_id
      t.integer :following_user_id
      t.string :status
      t.integer :updated_by_user_id
      t.datetime :created
      t.datetime :modified
      t.boolean :deleted
    end
  end
end
