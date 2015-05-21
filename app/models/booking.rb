class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :vendor
  belongs_to :property

  scope :pending, -> { where(status: 'pending') } 
  scope :confirmed, -> { where(status: 'confirmed') } 
  scope :canceled_or_rejected, -> { where(status: 'canceled by Customer') + where(status: 'rejected by vendor') + where(status: 'canceled by Vendor') } 
  scope :completed, -> { where(status: 'completed') } 
end
