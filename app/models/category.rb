class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true, uniqueness: true
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
