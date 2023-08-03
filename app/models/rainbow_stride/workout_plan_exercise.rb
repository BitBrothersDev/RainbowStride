# frozen_string_literal: true

module RainbowStride
  class WorkoutPlanExercise < ApplicationRecord
    belongs_to :exercise, class_name: 'RainbowStride::Exercise'
    belongs_to :workout_plan, class_name: 'RainbowStride::WorkoutPlan'
  end
end
