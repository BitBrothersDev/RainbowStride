class CreateRainbowStrideRegimenBlueprints < ActiveRecord::Migration[7.0]
  def change
    create_table :rainbow_stride_regimen_blueprints do |t|
      t.string :title
      t.datetime :duration

      t.timestamps
    end
  end
end
