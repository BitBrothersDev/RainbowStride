class RenamePlansTableToWorkoutPlans < ActiveRecord::Migration[7.0]
  def change
    rename_table :rainbow_stride_plans, :rainbow_stride_workout_plans
  end
end
