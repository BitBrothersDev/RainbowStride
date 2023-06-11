module RainbowStride
  class ExerciseLog < ApplicationRecord
    belongs_to :workout, class_name: "RainbowStride::Workout", foreign_key: :rainbow_stride_workout_id
    belongs_to :exercise, class_name: "RainbowStride::Exercise", foreign_key: :rainbow_stride_exercise_id
  end
end
