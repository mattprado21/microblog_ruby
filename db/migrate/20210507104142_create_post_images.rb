class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :image
      t.datetime :created
      t.datetime :modified
      t.boolean :deleted
    end
  end
end
