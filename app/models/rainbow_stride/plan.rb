module RainbowStride
  class Plan < ApplicationRecord
    belongs_to :user
    has_many :exercise_plan, dependent: :destroy, class_name: "RainbowStride::ExercisePlan"
    has_many :exercises, through: :exercise_plan, class_name: "RainbowStride::Exercise"
    has_many :workouts, :class_name => 'RainbowStride::Workout', foreign_key: :rainbow_stride_plan_id
  end
end
