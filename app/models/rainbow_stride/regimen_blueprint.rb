module RainbowStride
  class RegimenBlueprint < ApplicationRecord
    has_many :exercise_regimens, dependent: :destroy, class_name: "RainbowStride::ExerciseRegimen"
    has_many :exercises, through: :exercise_regimens, class_name: "RainbowStride::Exercise"
  end
end
