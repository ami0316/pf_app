class Booking < ApplicationRecord

   belongs_to :customer
   belongs_to :room

  validates :booking_date, presence: true
  validates :time, presence: true
  validates :number_of_people, presence: true

end