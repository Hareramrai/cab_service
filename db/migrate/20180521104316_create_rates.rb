class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.decimal :price
      t.string :unit
      t.references :vendor, foreign_key: true
      t.string :title
      t.timestamps
      t.boolean :marked_as_deleted, default: false
    end
  end
end
