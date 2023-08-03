# frozen_string_literal: true

module RainbowStride
  class MeasurementsController < ApplicationController
    before_action :set_measurement, only: %i[show edit update destroy]

    def index
      @measurements = current_user.measurements
      @measurement = Measurement.new
      @charts_data = {}
      @measurements.order('created_at DESC').group_by(&:measurement_type).each do |type, measurements|
        data = measurements.group_by { |m| m.date.to_date }.transform_values do |values|
          values.map(&:value).sum.to_f / values.size
        end
        @charts_data[type.name] = data
      end
    end

    def show; end

    def new
      @measurement = RainbowStride::Measurement.new
    end

    def create
      @measurement = Measurement.new(measurement_params)
      @measurement.user = current_user

      if @measurement.save
        redirect_to measurements_path, anchor: sanitize_id(@measurement.measurement_type.name), notice: 'RainbowStride::Measurement was successfully created.'
      else
        render :new, notice: @measurement.errors.full_messages
      end
    end

    def edit; end

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

    def sanitize_id(id)
      id.downcase.gsub(/\s+/, '-')
    end

    def set_measurement
      @measurement = RainbowStride::Measurement.find(params[:id])
    end

    def measurement_params
      params.require(:measurement).permit(:rainbow_stride_measurement_type_id, :value, :date)
    end
  end
end
