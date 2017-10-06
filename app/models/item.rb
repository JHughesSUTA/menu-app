class Item < ApplicationRecord
  belongs_to :category
  has_many :orders
  has_many :carted_items

  validates :name, :description, :price, :category_id, presence: true
  validates :price, :category_id, numericality: { greater_than: 0 }

  # ensures that at least one menu is chosen.  TODO: change validation error mesage
  validates :lunch, presence: { if: -> { dinner.blank? } }
  validates :dinner, presence: { if: -> { lunch.blank? } }
end