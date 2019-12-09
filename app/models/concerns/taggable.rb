module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings
    has_many :tags, through: :taggings
    after_save :save_tags, unless: :is_store?
  end

  def tag_names
    @tag_names.blank? ? tags.map(&:name).join(',') : @tag_names
  end
  
  def tag_names=(names)
    @tag_names = names
  end

  # def tagged_with(name)
  #   Tag.find_by!(name: name).posts
  # end

  private

  def save_tags
    tag_names.split(',').each do |name|
      tag = Tag.find_or_create_by(name: name.strip)
      if !tags.exists?(tag.id)
        save_tag_relation(tag.id)
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

  def is_store?
    self.class.name == 'Store'
  end
end