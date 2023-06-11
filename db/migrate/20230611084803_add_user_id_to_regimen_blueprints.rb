class AddUserIdToRegimenBlueprints < ActiveRecord::Migration[7.0]
  def change
    add_reference :rainbow_stride_regimen_blueprints, :user
  end
end
