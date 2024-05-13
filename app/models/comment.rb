class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :hotel

  validates :comment, presence: true
end
