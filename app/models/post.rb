class Post < ApplicationRecord
  belongs_to :user
  belongs_to :child_profile
  belongs_to :category, optional: true
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  validates :body, presence: true
  validates :post_type, inclusion: { in: %w[question experience milestone advice] }

  scope :published, -> { where.not(published_at: nil).order(published_at: :desc) }
  scope :recent, -> { published.limit(20) }
  scope :search, ->(query) {
    where("title ILIKE :q OR body ILIKE :q", q: "%#{sanitize_sql_like(query)}%")
  }

  def publish!
    update(published_at: Time.current)
  end
end

# == Schema Information
#
# Table name: posts
#
#  id               :bigint           not null, primary key
#  ai_answer        :text
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
