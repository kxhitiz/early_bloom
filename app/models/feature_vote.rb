class FeatureVote < ApplicationRecord
  belongs_to :user
  belongs_to :feature_request, counter_cache: :votes_count

  validates :user_id, uniqueness: { scope: :feature_request_id, message: "has already voted" }
end

# == Schema Information
#
# Table name: feature_votes
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  feature_request_id :bigint           not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_feature_votes_on_feature_request_id              (feature_request_id)
#  index_feature_votes_on_user_id                         (user_id)
#  index_feature_votes_on_user_id_and_feature_request_id  (user_id,feature_request_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (feature_request_id => feature_requests.id)
#  fk_rails_...  (user_id => users.id)
#
