module RainbowStride
  class WorkoutsController < ApplicationController
    before_action :authenticate_user!
    def index
      @workouts = current_user.workouts.order(created_at: :desc)
    end

    def new
      @regimen_blueprints = RegimenBlueprint.all
    end

    def create
      @workout = current_user.workouts.create!(rainbow_stride_regimen_blueprint_id: params[:rainbow_stride_regimen_blueprint_id], start_time: Time.now)
      redirect_to workout_path(@workout)
    end

    def show
      @workout = Workout.find(params[:id])
      @exercise_logs = @workout.exercise_logs
    end

    def finish
      @workout = Workout.find(params[:id])

      if @workout.update(end_time: Time.now)
        redirect_to workouts_path, notice: 'Workout finished successfully.'
      else
        redirect_to workout_path(@workout), alert: @workout.errors.full_messages.join(', ')
      end
    end
  end
end
