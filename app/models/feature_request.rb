class FeatureRequest < ApplicationRecord
  belongs_to :user, optional: true
  has_many :feature_votes, dependent: :destroy
  has_many :voters, through: :feature_votes, source: :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :guest_name, presence: true, if: -> { user_id.blank? }

  scope :popular, -> { order(votes_count: :desc, created_at: :desc) }
  scope :recent, -> { order(created_at: :desc) }

  STATUSES = %w[pending planned in_progress completed].freeze

  def voted_by?(user)
    return false unless user
    feature_votes.exists?(user: user)
  end

  def author_name
    user&.name || guest_name || "Anonymous"
  end
end

# == Schema Information
#
# Table name: feature_requests
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  guest_email :string
#  guest_name  :string
#  status      :string           default("pending")
#  title       :string           not null
#  votes_count :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_feature_requests_on_status       (status)
#  index_feature_requests_on_user_id      (user_id)
#  index_feature_requests_on_votes_count  (votes_count)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
