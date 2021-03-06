class Vendor < User
  after_create :create_schedule
  after_initialize :set_long_lat
  after_save :set_long_lat
  
  has_many :bookings
  has_many :reviews, through: :bookings
  geocoded_by :coordinates

  def set_long_lat
    self.latitude=self.zipcode.to_s.to_lat
    self.longitude=self.zipcode.to_s.to_lon
  end

  def create_schedule
   schedule=Schedule.new
   schedule.user=self
   schedule.save
  end

  def coordinates
    cord=[self.latitude,self.longitude]
  end
  def rate(property)
    self.base_rate+(property.bathrooms*self.bathroom_rate)+(property.bedrooms*self.bedroom_rate)
  end

  def update_review_score
    self.rating=(self.reviews.sum(:overall_rating).to_f/self.reviews.count).round(2)
    self.save
  end

  def sort_column
    Vendor.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
end