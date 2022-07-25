class Post < ApplicationRecord
  belongs_to :feed
  belongs_to :user
  has_many :comments

  has_rich_text :body

  scope :filter_by_title, -> (query) { where("title LIKE ?", "%#{query}%") }

  validates :title, presence: true, length: { minimum: 10, maximum: 90 }
end
