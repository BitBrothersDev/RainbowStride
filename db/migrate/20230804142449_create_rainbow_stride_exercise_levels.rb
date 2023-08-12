class CreateRainbowStrideExerciseLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_exercise_levels do |t|
      ### pls for associations generate short index names
      t.references :rainbow_stride_exercise, null: false, foreign_key: true,
                   index: { name: 'index_rse_on_rse_id' }
      t.references :rainbow_stride_level, null: false, foreign_key: true,
                   index: { name: 'index_rse_on_rsl_id' }
      t.string :description
      t.string :how_to_do

      t.timestamps
    end
  end
end
