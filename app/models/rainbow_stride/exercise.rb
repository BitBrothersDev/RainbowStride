module RainbowStride
  class Exercise < ApplicationRecord
    belongs_to :user
    belongs_to :level, :class_name => 'RainbowStride::Level', foreign_key: :rainbow_stride_level_id
    has_many :workout_plan_exercises, class_name: "RainbowStride::WorkoutPlanExercise", dependent: :destroy
    has_many :workout_plans, class_name: "RainbowStride::WorkoutPlan", through: :exercise_plan
    has_many :exercise_logs, class_name: "RainbowStride::ExerciseLog"
  end
end
