class Customer < User
  ratyrate_rater
  has_many :bookings
  has_many :reviews, through: :bookings

end
