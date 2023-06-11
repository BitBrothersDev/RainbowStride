class CreateRainbowStrideExerciseLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_exercise_logs do |t|
      t.references :rainbow_stride_workout, null: false, foreign_key: true, index: { name: "index_exercise_logs_on_workout_id" }
      t.references :rainbow_stride_exercise, null: false, foreign_key: true, index: { name: "index_exercise_logs_on_exercise_id" }
      t.decimal :weight
      t.integer :repetitions
      t.integer :rest_time
      t.integer :exercise_time

      t.timestamps
    end
  end
end