class ChildProfile < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :birth_date, presence: true

  def age_in_months
    return 0 unless birth_date
    ((Time.current - birth_date.to_time) / 1.month).floor
  end

  def age_in_days
    return 0 unless birth_date
    (Time.current.to_date - birth_date).to_i
  end
end

# == Schema Information
#
# Table name: child_profiles
#
#  id         :bigint           not null, primary key
#  birth_date :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_child_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
