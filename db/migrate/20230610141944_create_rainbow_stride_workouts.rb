class CreateRainbowStrideWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_workouts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rainbow_stride_regimen_blueprint, null: false, foreign_key: { to_table: :rainbow_stride_regimen_blueprints }, index: { name: 'index_workouts_on_regimen_blueprint_id' }
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end