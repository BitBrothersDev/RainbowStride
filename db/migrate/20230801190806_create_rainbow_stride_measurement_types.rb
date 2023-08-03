class CreateRainbowStrideMeasurementTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_measurement_types do |t|
      t.string :name
      t.string :unit

      t.timestamps
    end
  end
end
