class Hotel < ApplicationRecord
   has_many :comments, dependent: :destroy
   has_many :rooms, dependent: :destroy
   belongs_to :admin

  validates :hotel_name, presence: true
  validates :body, presence: true
  validates :url, presence: true
  validates :telephone_number, presence: true
  validates :address, presence: true

  geocoded_by :address #addressカラムの内容を緯度・経度に変換すること
  after_validation :geocode #バリデーションの実行後に変換処理を実行して、latitudeカラム・longitudeカラムに緯度・経度の値が入力される

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
