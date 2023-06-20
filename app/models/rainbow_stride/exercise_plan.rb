module RainbowStride
  class ExercisePlan < ApplicationRecord
    belongs_to :exercise, class_name: "RainbowStride::Exercise"
    belongs_to :plan, class_name: "RainbowStride::Plan"
  end
end
