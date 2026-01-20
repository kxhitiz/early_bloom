class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :reaction_type, presence: true, inclusion: { in: %w[helpful reassuring relatable celebrate] }
  validates :user_id, uniqueness: { scope: :post_id, message: "can only react once per post" }
end

# == Schema Information
#
# Table name: reactions
#
#  id            :bigint           not null, primary key
#  reaction_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  post_id       :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_reactions_on_post_id  (post_id)
#  index_reactions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
