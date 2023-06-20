class AddUserIdToPlans < ActiveRecord::Migration[7.0]
  def change
    add_reference :rainbow_stride_plans, :user
  end
end
