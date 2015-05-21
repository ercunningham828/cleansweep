class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :customer, index: true
      t.references :vendor, index: true
      t.date :date
      t.time :time
      t.integer :cost
      t.string :status

      t.timestamps null: false
    end
    add_foreign_key :bookings, :customers
    add_foreign_key :bookings, :vendors
  end
end
