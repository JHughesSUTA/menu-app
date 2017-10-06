class Item < ApplicationRecord
  belongs_to :category
  has_many :orders
  has_many :carted_items

  validates :name, :description, :price, :category_id, :lunch, :dinner, presence: true
  validates :price, :category_id, numericality: { greater_than: 0 }
end