module RainbowStride
  class ExerciseLevel < ApplicationRecord
    belongs_to :level, :class_name => 'RainbowStride::Level', foreign_key: :rainbow_stride_level_id
    belongs_to :exercise, :class_name => 'RainbowStride::Exercise', foreign_key: :rainbow_stride_exercise_id
  end
end
