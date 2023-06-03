class CreateRainbowStrideExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_exercises do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
