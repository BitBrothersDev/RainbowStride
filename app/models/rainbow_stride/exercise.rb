module RainbowStride
  class Exercise < ApplicationRecord
    belongs_to :user
    belongs_to :level, :class_name => 'RainbowStride::Level', foreign_key: :rainbow_stride_level_id
    has_many :exercise_plan, class_name: "RainbowStride::ExercisePlan", dependent: :destroy
    has_many :plans, class_name: "RainbowStride::Plan", through: :exercise_plan
    has_many :exercise_logs, class_name: "RainbowStride::ExerciseLog"
  end
end
