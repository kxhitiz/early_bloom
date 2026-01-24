class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true, uniqueness: true

  def slug
    name.parameterize
  end

  def self.find_by_slug(slug)
    all.find { |c| c.slug == slug }
  end

  def to_param
    slug
  end
end

# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  color       :string
#  description :string
#  icon        :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
