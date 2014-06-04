class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :date
      t.integer :from_airport_id
      t.integer :to_airport_id
      t.integer :duration

      t.timestamps
    end
  end
end
