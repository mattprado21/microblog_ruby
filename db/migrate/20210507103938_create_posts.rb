class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :content
      t.integer :post_id
      t.integer :author_id
      t.string :shared_content
      t.datetime :shared_created
      t.datetime :created
      t.datetime :modified
      t.boolean :deleted
    end
  end
end
