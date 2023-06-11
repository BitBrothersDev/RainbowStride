module RainbowStride
  class Workout < ApplicationRecord
    belongs_to :user
    belongs_to :regimen_blueprint, class_name: "RainbowStride::RegimenBlueprint", foreign_key: :rainbow_stride_regimen_blueprint_id
    has_many :exercise_logs, class_name: "RainbowStride::ExerciseLog", foreign_key: :rainbow_stride_workout_id
  end
end
