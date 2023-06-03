class CreateRainbowStrideEffortStages < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_effort_stages do |t|
      t.string :name

      t.timestamps
    end
  end
end
