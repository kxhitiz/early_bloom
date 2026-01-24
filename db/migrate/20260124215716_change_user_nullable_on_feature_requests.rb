class ChangeUserNullableOnFeatureRequests < ActiveRecord::Migration[8.0]
  def change
    change_column_null :feature_requests, :user_id, true
    add_column :feature_requests, :guest_name, :string
    add_column :feature_requests, :guest_email, :string
  end
end
