class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.string :sensor_id
      t.float :temperature
      t.timestamps
    end
  end
end
