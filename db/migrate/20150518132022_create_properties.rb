class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :user, index: true
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :type

      t.timestamps null: false
    end
    add_foreign_key :properties, :users
  end
end
