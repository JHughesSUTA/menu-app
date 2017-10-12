class User < ApplicationRecord
  has_secure_password
  
  has_many :orders
  has_many :carted_items

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
end