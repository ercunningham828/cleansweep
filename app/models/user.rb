class User < ActiveRecord::Base
  after_save :create_schedule
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

  def create_schedule
   schedule=Schedule.new
   schedule.user=self
   schedule.save
  end
end

class Customer < User;end
class Vendor < User;end