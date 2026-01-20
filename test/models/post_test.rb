require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: posts
#
#  id               :bigint           not null, primary key
#  body             :text
#  post_type        :string
#  published_at     :datetime
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :bigint
#  child_profile_id :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_posts_on_category_id       (category_id)
#  index_posts_on_child_profile_id  (child_profile_id)
#  index_posts_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (child_profile_id => child_profiles.id)
#  fk_rails_...  (user_id => users.id)
#
