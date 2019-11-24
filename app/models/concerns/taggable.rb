module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings
    has_many :tags, through: :taggings
  end

  def tag_names
    @tag_names.blank? ? tags.map(&:name).join(', ') : @tag_names
  end
  
  def tag_names=(names)
    @tag_names = names
  end

  # def tagged_with(name)
  #   Tag.find_by!(name: name).posts
  # end

  def tag_list
    tags.map(&:name).join(', ')
  end

  private

  def save_tags
    tag_names.split(',').each do |name|
      tag = Tag.find_or_create_by(name: name.strip)
      if !tags.exists?(tag.id)
        Tagging.new({
          tag_id: tag.id,
          store_id: self.store_id,
          product_id: self.id
        }).save!
      end
    end
    
    clean_tags
  end

  def clean_tags
    names = tag_names.split(',').map { |n| n.strip }
    tags.each do |tag|
      tags.destroy(tag) unless names.include?(tag.name)
    end
  end
end