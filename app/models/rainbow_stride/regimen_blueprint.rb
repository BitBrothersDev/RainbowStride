module RainbowStride
  class RegimenBlueprint < ApplicationRecord
    belongs_to :user
    has_many :exercise_regimens, dependent: :destroy, class_name: "RainbowStride::ExerciseRegimen"
    has_many :exercises, through: :exercise_regimens, class_name: "RainbowStride::Exercise"
    has_many :workouts, :class_name => 'RainbowStride::Workout', foreign_key: :rainbow_stride_regimen_blueprint_id
  end
end
