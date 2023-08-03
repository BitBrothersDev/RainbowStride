# frozen_string_literal: true

module RainbowStride
  class Measurement < ApplicationRecord
    belongs_to :user, class_name: 'RainbowGate::User', foreign_key: :user_id

    belongs_to :measurement_type, class_name: 'RainbowStride::MeasurementType', foreign_key: :rainbow_stride_measurement_type_id
  end
end
