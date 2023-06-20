class CreateRainbowStrideExercisePlan < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_exercise_plans do |t|
      t.belongs_to :exercise, null: false, foreign_key: { to_table: :rainbow_stride_exercises }
      t.belongs_to :plan, null: false, foreign_key: { to_table: :rainbow_stride_plans }

      t.timestamps
    end
  end
end
