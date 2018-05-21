class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :city
      t.string :state
      t.string :country
      t.integer :number_of_trips
      t.float :ratings
      t.timestamp :join_on
      t.boolean :is_online
      t.float :current_latitude
      t.float :current_longitude
      t.float :trip_end_lat
      t.float :trip_end_long
      t.references :owner, foreign_key: true
      t.boolean :marked_as_deleted, default: false
      t.timestamps
    end
  end
end
