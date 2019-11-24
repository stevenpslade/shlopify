class Tag < ApplicationRecord
  has_many :taggings
  has_many :products, through: :taggings
  has_many :stores, through: :taggings

  has_many :collection_tags
  has_many :collections, through: :collection_tags
end
