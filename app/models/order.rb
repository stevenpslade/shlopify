class Order < ApplicationRecord
  belongs_to :store
  has_many   :order_products, dependent: :destroy
  has_many   :products, through: :order_products

  accepts_nested_attributes_for :order_products

  enum status: [:draft, :complete, :incomplete]
  enum payment_status: ['', :pending, :success, :failed]
  enum fulfillment_status: [:unfulfilled, :fulfilled]

  default_scope -> { order(created_at: :desc) }

  validates :store_id, presence: true
end