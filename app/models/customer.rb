class Customer < User
  has_many :bookings
  has_many :reviews, through: :bookings

  letsrate_rater

end
