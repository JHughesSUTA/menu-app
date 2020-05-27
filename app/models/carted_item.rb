class CartedItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :order, optional: true  #optional true as items are carted before an order is processed 

  validates :quantity,
            presence: true,
            numericality: { greater_than: 0,
                            less_than: 11,
                            only_integer: true }
end