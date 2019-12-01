class Collection < ApplicationRecord
  belongs_to :store

  has_many   :collection_products
  has_many   :products, through: :collection_products

  has_many   :collection_tags
  has_many   :tags, through: :collection_tags

  has_one_attached :image

  enum condition_type: [:automatic, :manual]

  class << self

    def get_collection_tags_from_collections(collections)
      collection_ids = collections.map(&:id)
      CollectionTag.where(collection_id: collection_ids)
    end
    
  end
end
