class CreateFeatureRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :feature_requests do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :user, null: false, foreign_key: true
      t.string :status, default: "pending"
      t.integer :votes_count, default: 0

      t.timestamps
    end
    add_index :feature_requests, :status
    add_index :feature_requests, :votes_count
  end
end
