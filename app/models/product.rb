class Product < ApplicationRecord
  belongs_to :store

  default_scope -> { order(created_at: :desc) }

  validates :store_id, presence: true
  validates :title, presence: true, length: { maximum: 65 }
  validates :price, presence: true
end
