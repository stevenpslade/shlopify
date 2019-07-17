class Order < ApplicationRecord
  belongs_to :store
  has_many   :products, through: :order_products

  enum status: [:draft, :complete, :incomplete]
  enum payment_status: ['', :pending, :success, :failed]
  enum fulfillment_status: [:unfulfilled, :fulfilled]
end