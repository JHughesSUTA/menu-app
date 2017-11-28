class Item < ApplicationRecord
  belongs_to :category
  # has_many :orders
  has_many :carted_items

  validates :name, :description, :price, :category_id, presence: true
  validates :price, :category_id, numericality: { greater_than: 0 }

  validate :has_one_menu

  # custom error message when a menu is not slected for new item
  def has_one_menu
    errors[:base] << "You must select at least one menu" unless (lunch || dinner)
  end
end