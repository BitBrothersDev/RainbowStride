class CreateRainbowStrideMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_measurements do |t|
      t.references :user, null: false, foreign_key: true
      t.string :measurement_type
      t.float :value
      t.date :date

      t.timestamps
    end
  end
end
