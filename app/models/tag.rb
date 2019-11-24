class Tag < ApplicationRecord
  has_many :taggings
  has_many :products, through: :taggings
  has_many :stores, through: :taggings
end
