class Feed < ApplicationRecord
  has_many :posts
  
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 100 }
end
