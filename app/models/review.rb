class Review < ActiveRecord::Base
  ratyrate_rateable "overall"
  belongs_to :booking
  
end
