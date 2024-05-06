class Room < ApplicationRecord
   has_many :bookings, dependent: :destroy
   belongs_to :hotel

   # ActiveStorageの設定
  has_one_attached :image


  validates :room_name, presence: true
  validates :room_details, presence: true
  validates :price, presence: true

end
