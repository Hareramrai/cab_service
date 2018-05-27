class AddDriverToCabs < ActiveRecord::Migration[5.1]
  def change
    add_reference :cabs, :driver, foreign_key: true
  end
end
