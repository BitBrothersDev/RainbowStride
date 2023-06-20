class AddRainbowStrideLevelIdToExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :rainbow_stride_exercises, :rainbow_stride_level, foreign_key: true, index: { name: 'index_exercises_on_level_id' }
  end
end