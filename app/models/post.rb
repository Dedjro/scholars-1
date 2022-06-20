class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :image
  # has_rich_text :content

  validates :content,:title, presence: true
  validates :slug, uniqueness: true
end
