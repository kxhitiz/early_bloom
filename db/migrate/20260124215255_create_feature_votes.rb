class CreateFeatureVotes < ActiveRecord::Migration[8.0]
  def change
    create_table :feature_votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :feature_request, null: false, foreign_key: true

      t.timestamps
    end
    add_index :feature_votes, [:user_id, :feature_request_id], unique: true
  end
end
