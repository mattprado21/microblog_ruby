class CreatePostReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :post_reactions do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id
      t.datetime :created
    end
  end
end
