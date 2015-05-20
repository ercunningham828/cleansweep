class User < ActiveRecord::Base
  has_many :properties
  has_one :schedule
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  self.inheritance_column = :role

  def self.roles
    %w(Customer Vendor)
  end

  scope :customers, -> { where(role: 'Customer') } 
  scope :vendors, -> { where(role: 'Vendor') } 

  
end
class Customer < User;end
class Vendor < User
  after_create :create_schedule
  after_initialize :set_long_lat
  after_save :set_long_lat
  
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
end