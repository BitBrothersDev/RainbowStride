module RainbowStride
  class Exercise < ApplicationRecord
    belongs_to :user
    has_many :exercise_levels, class_name: "RainbowStride::ExerciseLevel", dependent: :destroy, foreign_key: :rainbow_stride_exercise_id
    has_many :workout_plan_exercises, class_name: "RainbowStride::WorkoutPlanExercise", dependent: :destroy
    has_many :workout_plans, class_name: "RainbowStride::WorkoutPlan", through: :exercise_plan
    has_many :exercise_logs, class_name: "RainbowStride::ExerciseLog"

    has_many :levels, through: :exercise_levels
    belongs_to :junior_description, -> { exercise_levels.where(levels: {name: "Початківець"}) }, class_name: 'RainbowStride::Exercise', optional: true
  end
end
