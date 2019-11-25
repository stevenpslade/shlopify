class Collection < ApplicationRecord
  belongs_to :store

  has_many   :collection_products
  has_many   :products, through: :collection_products

  has_many   :collection_tags
  has_many   :tags, through: :collection_tags

  has_one_attached :image

  enum condition_type: [:automatic, :manual]
end