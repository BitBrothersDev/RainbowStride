class AddLevelToWorkoutPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :rainbow_stride_workout_plans, :level_id, :integer, index: true, foreign_key: true
  end
end
