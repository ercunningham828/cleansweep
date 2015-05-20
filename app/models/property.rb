class Property < ActiveRecord::Base
  belongs_to :user
  after_initialize :update_lat_long
  after_save :update_lat_long
 
  def update_lat_long
    self.latitude=self.zipcode.to_s.to_lat
    self.longitude=self.zipcode.to_s.to_lon
  end

  def coordinates
    cord=[self.latitude,self.longitude]
  end
end
