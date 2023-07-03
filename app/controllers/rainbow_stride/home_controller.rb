# app/controllers/rainbow_controller.rb
module RainbowStride
  class HomeController < ApplicationController
    def generate_svg
      @user_data = params[:user_data]
      @measurements = current_user.measurements.order("created_at DESC").group_by(&:measurement_type)
    end
  end

end