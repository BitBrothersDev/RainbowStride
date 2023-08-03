module RainbowStride
  class Workout < ApplicationRecord
    belongs_to :user
    belongs_to :workout_plan, class_name: "RainbowStride::WorkoutPlan", foreign_key: :rainbow_stride_plan_id
    has_many :exercise_logs, class_name: "RainbowStride::ExerciseLog", foreign_key: :rainbow_stride_workout_id
  end
end
