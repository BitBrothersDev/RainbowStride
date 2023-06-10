module RainbowStride
  class ExerciseRegimen < ApplicationRecord
    belongs_to :exercise, class_name: "RainbowStride::Exercise"
    belongs_to :regimen_blueprint, class_name: "RainbowStride::RegimenBlueprint"
  end
end
