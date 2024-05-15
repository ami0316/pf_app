class Room < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :hotel
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  
   # ActiveStorageの設定
  has_one_attached :image


  validates :room_name, presence: true
  validates :room_details, presence: true
  validates :price, presence: true
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      rooms = Room.where("room_name LIKE?", "#{word}")
    elsif search == "partial_match"
      rooms = Room.where("room_name LIKE?","%#{word}%")
    else
      rooms = Room.all
    end
  end

end
