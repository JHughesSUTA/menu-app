class Category < ApplicationRecord
  has_many :items

  validates :name, presence: true
  validates :name, length: { maximum: 15 }
end