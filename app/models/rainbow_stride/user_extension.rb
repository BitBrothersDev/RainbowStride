module RainbowStride
  module UserExtension
    extend ActiveSupport::Concern

    included do
      has_many :measurements, class_name: "RainbowStride::Measurement", foreign_key: :user_id
      has_many :workouts, class_name: "RainbowStride::Workout"
      has_many :exercises, class_name: "RainbowStride::Exercise"
      has_many :exercise_logs, :class_name => 'RainbowStride::ExerciseLog', through: :workouts
      has_many :workout_plans, :class_name => 'RainbowStride::WorkoutPlan', foreign_key: :user_id
    end
  end
end