module RainbowStride
  class EffortStage < ApplicationRecord
    has_many :exercises, :class_name => 'RainbowStride::Exercise', foreign_key: :rainbow_stride_effort_stage_id
  end
end
