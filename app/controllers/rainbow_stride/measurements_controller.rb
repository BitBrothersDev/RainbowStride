module RainbowStride
  class MeasurementsController < ApplicationController
    before_action :set_measurement, only: [:show, :edit, :update, :destroy]

    def index
      @measurements = RainbowStride::Measurement.where(user_id: current_user.id)
    end

    def show
    end

    def new
      @measurement = RainbowStride::Measurement.new
    end

    def create
      @measurement = RainbowStride::Measurement.new(measurement_params)
      @measurement.user = current_user

      if @measurement.save
        redirect_to generate_svg_path, notice: 'RainbowStride::Measurement was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @measurement.update(measurement_params)
        redirect_to @measurement, notice: 'RainbowStride::Measurement was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @measurement.destroy
      redirect_to measurements_url, notice: 'RainbowStride::Measurement was successfully destroyed.'
    end

    private

    def set_measurement
      @measurement = RainbowStride::Measurement.find(params[:id])
    end

    def measurement_params
      params.require(:measurement).permit(:measurement_type, :value, :date)
    end
  end
end
