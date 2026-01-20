class CreateChildProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :child_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :birth_date

      t.timestamps
    end
  end
end
