class TagRelationship < ApplicationRecord
  belongs_to :room
  belongs_to :tag
end
