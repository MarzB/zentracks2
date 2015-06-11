class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.datetime :arrival_date_time
      t.datetime :departure_date_time
      t.string :street_address
      t.integer :location_id
      t.integer :trip_id

      t.timestamps

    end
  end
end
