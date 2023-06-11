module RainbowStride
  class ExerciseLogsController < ApplicationController
    def create
      @exercise_log = ExerciseLog.new(exercise_log_params)
      @exercise_log.rainbow_stride_workout_id = params[:workout_id]
      @workout = Workout.find(params[:workout_id])

      if @exercise_log.save
        redirect_to workout_path(@workout), notice: 'Exercise log created successfully.'
      else
        redirect_to workout_path(@workout), alert: @exercise_log.errors.full_messages.join(', ')
      end
    end

    def update
      @exercise_log = ExerciseLog.find(params[:id])
      @workout = Workout.find(params[:workout_id])

      if @exercise_log.update(exercise_log_params)
        redirect_to workout_path(@workout), notice: 'Exercise log updated successfully.'
      else
        redirect_to workout_path(@workout), alert: @exercise_log.errors.full_messages.join(', ')
      end
    end

    private

    def exercise_log_params
      params.require(:exercise_log).permit(:rainbow_stride_exercise_id, :weight, :repetitions, :rest_time, :exercise_time)
    end
  end
end
