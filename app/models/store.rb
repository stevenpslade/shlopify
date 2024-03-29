class Store < ApplicationRecord
  include Taggable
  
  has_and_belongs_to_many :admin_users, class_name: "Admin::User"
  has_many :products
  has_many :orders
  has_many :collections

  validates :subdomain, presence: true, length: { maximum: 255 },
                        uniqueness: { case_sensitive: false }, 
                        exclusion: { in: %w( support blog www billing help api dev ), message: "%{value} is reserved." }

  VALID_SUBDOMAIN_REGEX = /\A[A-Za-z0-9-]+\z/
  validates :subdomain, format: { with: VALID_SUBDOMAIN_REGEX, 
    message: 'The subdomain can only contain alphanumeric characters and dashes.' }

  before_save :downcase_subdomain

  def find_by_subdomain(subdomain)
    store = find_by(subdomain: subdomain)
    if store && store.active
      store
    end
  end

  private

    def downcase_subdomain
      subdomain.downcase!
    end
end
