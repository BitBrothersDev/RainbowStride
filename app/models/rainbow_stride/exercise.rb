module RainbowStride
  class Exercise < ApplicationRecord
    belongs_to :user
    belongs_to :effort_stage, :class_name => 'RainbowStride::EffortStage', foreign_key: :rainbow_stride_effort_stage_id
    has_many :exercise_regimens, class_name: "RainbowStride::ExerciseRegimen", dependent: :destroy
    has_many :regimen_blueprints, class_name: "RainbowStride::RegimenBlueprint", through: :exercise_regimens
    has_many :exercise_logs, class_name: "RainbowStride::ExerciseLog"
  end
end
