module RainbowStride
  class WorkoutPlan < ApplicationRecord
    belongs_to :user
    has_many :workout_plan_exercises, dependent: :destroy, class_name: "RainbowStride::WorkoutPlanExercise"
    has_many :exercises, through: :workout_plan_exercises, class_name: "RainbowStride::Exercise"
    has_many :workouts, :class_name => 'RainbowStride::Workout', foreign_key: :rainbow_stride_plan_id
  end
end
