class Hotel < ApplicationRecord
   has_many :comments, dependent: :destroy
   has_many :rooms, dependent: :destroy
end
