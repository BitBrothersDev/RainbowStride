class CreateRainbowStrideWorkoutPlanExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_workout_plan_exercises do |t|
      t.belongs_to :exercise, null: false, foreign_key: { to_table: :rainbow_stride_exercises }
      t.belongs_to :workout_plan, null: false, foreign_key: { to_table: :rainbow_stride_workout_plans }

      t.timestamps
    end
  end
end
