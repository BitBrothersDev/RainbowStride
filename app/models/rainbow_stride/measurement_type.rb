module RainbowStride
  class MeasurementType < ApplicationRecord
    has_many :measurements, class_name: 'RainbowStride::Measurement', foreign_key: :rainbow_stride_measurement_type_id

    def to_s
      [name, "(#{unit})"].join('  ')
    end
  end
end
