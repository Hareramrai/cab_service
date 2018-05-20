class CreateCabModels < ActiveRecord::Migration[5.1]
  def change
    create_table :cab_models do |t|
      t.string :name
      t.string :company
      t.string :engine
      t.integer :seats
      t.string :color
      t.boolean :air_conditioning
      t.boolean :marked_as_deleted, default: false
      t.timestamps
    end
  end
end
