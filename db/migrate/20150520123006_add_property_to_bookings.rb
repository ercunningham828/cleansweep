class AddPropertyToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :property, index: true
    add_foreign_key :bookings, :properties
  end
end
