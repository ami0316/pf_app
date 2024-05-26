class Booking < ApplicationRecord

   belongs_to :customer
   belongs_to :room
   has_many :tag_relationships, dependent: :destroy
   has_many :tags, through: :tag_relationships

  validates :booking_date, presence: true
  validates :time, presence: true
  validates :number_of_people, presence: true

end  