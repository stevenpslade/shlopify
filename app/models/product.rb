class Product < ApplicationRecord
  include Taggable
  after_save :save_tags

  belongs_to :store
  has_many   :order_products
  has_many   :orders, through: :order_products

  has_many_attached :images

  default_scope -> { order(created_at: :desc) }

  validates :store_id, presence: true
  validates :title, presence: true, length: { maximum: 65 }
  validates :price, presence: true
end
