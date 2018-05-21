class CreateCabs < ActiveRecord::Migration[5.1]
  def change
    create_table :cabs do |t|
      t.string :plat_number
      t.boolean :wi_fi
      t.string :type
      t.boolean :audio_system
      t.references :cab_model, foreign_key: true
      t.string :description
      t.boolean :marked_as_deleted, default: false
      t.timestamps
    end
  end
end
