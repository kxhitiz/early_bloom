class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :child_profile, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.string :post_type
      t.datetime :published_at

      t.timestamps
    end
  end
end
