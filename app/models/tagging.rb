class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :product
  belongs_to :store
end
