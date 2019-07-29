class Product < ApplicationRecord
  belongs_to :store
  has_many   :order_products
  has_many   :orders, through: :order_products

  # image upload
  has_many :product_images, class_name: 'Admin::ProductImage', dependent: :destroy
  accepts_nested_attributes_for :product_images

  default_scope -> { order(created_at: :desc) }

  validates :store_id, presence: true
  validates :title, presence: true, length: { maximum: 65 }
  validates :price, presence: true
end
