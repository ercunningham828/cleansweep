class Property < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  after_initialize :update_lat_long
  after_save :update_lat_long
 
  def update_lat_long
    self.latitude=self.zipcode.to_s.to_lat
    self.longitude=self.zipcode.to_s.to_lon
  end

  def coordinates
    cord=[self.latitude,self.longitude]
  end

  def name_and_address
    "#{self.name} (#{self.street_address})"
  end

  def name_and_full_address
    "#{self.name} (#{self.street_address}, #{self.city}, #{self.state})"
  end
  
end
