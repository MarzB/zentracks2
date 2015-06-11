class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :country
      t.string :position
      t.integer :trip_id
      t.string :city
      t.string :state

      t.timestamps

    end
  end
end
