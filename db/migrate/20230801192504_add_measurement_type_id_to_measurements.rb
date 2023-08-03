class AddMeasurementTypeIdToMeasurements < ActiveRecord::Migration[7.0]
  def change
    add_reference :rainbow_stride_measurements, :rainbow_stride_measurement_type, null: false, foreign_key: true, index: { name: 'index_rs_m_on_rs_mt_id' }
  end
end
