class CreateRainbowStrideExerciseRegimen < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_exercise_regimen do |t|
      t.belongs_to :exercise, null: false, foreign_key: { to_table: :rainbow_stride_exercises }
      t.belongs_to :regimen_blueprint, null: false, foreign_key: { to_table: :rainbow_stride_regimen_blueprints }

      t.timestamps
    end
  end
end
