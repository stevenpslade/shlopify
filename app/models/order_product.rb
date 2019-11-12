class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_presence_of :order_id, :product_id, :price, :title, :quantity

  def total
    price * quantity
  end
end