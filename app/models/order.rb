class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true
  has_many :carted_items
  has_many :items, through: :carted_items

  def order_totals
    subtotal = 0 
    carted_items.each do |carted_item|
      subtotal += carted_item.quantity * carted_item.item.price
    end
    tax = subtotal * 0.09 
    total = subtotal + tax
    update(subtotal: subtotal, tax: tax, total: total)
  end
end