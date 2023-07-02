# app/controllers/rainbow_controller.rb
module RainbowStride
  class HomeController < ApplicationController
    def generate_svg
      @user_data = params[:user_data]
    end
  end

end