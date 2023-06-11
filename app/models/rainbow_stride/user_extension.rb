module RainbowStride
  module UserExtension
    extend ActiveSupport::Concern

    included do
      has_many :workouts, class_name: "RainbowStride::Workout"
    end
  end
end