class Hotel < ApplicationRecord
   has_many :comments, dependent: :destroy
   has_many :rooms, dependent: :destroy
   belongs_to :admin

  validates :hotel_name, presence: true
  validates :body, presence: true
  validates :url, presence: true
  validates :telephone_number, presence: true

   # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      hotels = Hotel.where("hotel_name LIKE?", "#{word}")
    elsif search == "partial_match"
      hotels = Hotel.where("hotel_name LIKE?","%#{word}%")
    else
      hotels = Hotel.all
    end
  end
end
