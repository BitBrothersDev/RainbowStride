class CreateRainbowStrideLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
