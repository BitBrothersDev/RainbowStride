module RainbowStride
  module UserExtension
    extend ActiveSupport::Concern

    included do
      has_many :workouts, class_name: "RainbowStride::Workout"
      has_many :exercises, class_name: "RainbowStride::Exercise"
      has_many :exercise_logs, :class_name => 'RainbowStride::ExerciseLog', through: :workouts
      has_many :regimen_blueprints, :class_name => 'RainbowStride::RegimenBlueprint', foreign_key: :user_id
    end
  end
end