class AddDataToPlanExercises < ActiveRecord::Migration[7.0]
  def change
    add_column :rainbow_stride_workout_plan_exercises, :repetitions, :integer
    add_column :rainbow_stride_workout_plan_exercises, :rounds, :integer
    add_column :rainbow_stride_workout_plan_exercises, :weight, :float
    add_column :rainbow_stride_workout_plan_exercises, :instructions, :text
  end
end
