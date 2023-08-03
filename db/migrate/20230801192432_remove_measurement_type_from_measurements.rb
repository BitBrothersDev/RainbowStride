class RemoveMeasurementTypeFromMeasurements < ActiveRecord::Migration[7.0]
  def change
    remove_column :rainbow_stride_measurements, :measurement_type
  end
end
