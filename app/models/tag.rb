class Tag < ApplicationRecord
  has_many :taggings
  has_many :products, through: :taggings
  has_many :stores, through: :taggings

  has_many :collection_tags
  has_many :collections, through: :collection_tags

  class << self

    def get_tags_by_collection_id(collections)
      collection_tags = Collection.get_collection_tags_from_collections(collections)

      tag_ids         = collection_tags.map(&:tag_id)
      tags_by_id      = get_tags_by_id(tag_ids)
      
      tags_by_collection_id = Hash.new {|h,k| h[k] = [] }
      collection_tags.each { |ct| tags_by_collection_id[ct.collection_id] << tags_by_id[ct.tag_id] }

      tags_by_collection_id
    end

    private

      def get_tags_by_id(ids)
        Tag.where(id: ids).map { |tag| [tag.id, tag] }.to_h
      end

  end
end
