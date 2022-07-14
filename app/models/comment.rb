class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :content, presence: true
end
