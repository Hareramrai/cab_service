class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :zip
      t.string :state
      t.string :country
      t.boolean :active
      t.references :vendor, foreign_key: true
      t.boolean :marked_as_deleted, default: false
      t.timestamps
    end
  end
end
