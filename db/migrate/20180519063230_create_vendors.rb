class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :description
      t.boolean :marked_as_deleted, default: false
      t.timestamps
    end
  end
end
