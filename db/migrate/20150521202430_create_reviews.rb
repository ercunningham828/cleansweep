class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :booking, index:true
      t.integer :timeliness_rating
      t.integer :professional_rating
      t.integer :clean_rating
      t.integer :overall_rating

      t.timestamps null: false
    end
 add_foreign_key :reviews, :bookings
  end
end
