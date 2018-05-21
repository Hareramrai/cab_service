class CreateRiders < ActiveRecord::Migration[5.1]
  def change
    create_table :riders do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :city
      t.string :state
      t.string :country
      t.string :gender
      t.boolean :subscribe_for_notification
      t.float :ratings
      t.integer :number_of_trips
      t.boolean :marked_as_deleted, default: false
      t.timestamps
    end
  end
end
