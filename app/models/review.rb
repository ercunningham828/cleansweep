class Review < ActiveRecord::Base
  belongs_to :booking
  letsrate_rateable "timeliness", "professionalism", "quality", "overall"
end
