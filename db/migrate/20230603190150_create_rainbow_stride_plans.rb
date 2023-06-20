class CreateRainbowStridePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_plans do |t|
      t.string :title
      t.datetime :duration

      t.timestamps
    end
  end
end
