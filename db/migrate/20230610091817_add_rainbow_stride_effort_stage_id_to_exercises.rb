class AddRainbowStrideEffortStageIdToExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :rainbow_stride_exercises, :rainbow_stride_effort_stage, foreign_key: true, index: { name: 'index_exercises_on_effort_stage_id' }
  end
end