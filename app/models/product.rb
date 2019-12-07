class Product < ApplicationRecord
  include Taggable

  belongs_to :store
  
  has_many   :order_products
  has_many   :orders, through: :order_products

  has_many   :collection_products
  has_many   :collections, through: :collection_products

  has_many_attached :images

  default_scope -> { order(created_at: :desc) }

  validates :store_id, presence: true
  validates :title, presence: true, length: { maximum: 65 }
  validates :price, presence: true

  def save_tag_relation(tag_id)
    Tagging.new({
      tag_id: tag_id,
      store_id: store_id,
      product_id: id
    }).save!
  end
end
