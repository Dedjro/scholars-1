class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title,:description,:status
end
