class Feed < ApplicationRecord
  has_many :posts
  
  validates :name, presence: true, uniqueness: true, length { minimum: 5, maximum: 100 }
end
