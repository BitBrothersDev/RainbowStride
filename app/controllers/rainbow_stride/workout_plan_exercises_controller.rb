module RainbowStride
  class WorkoutPlanExercisesController < ApplicationController
    def update
      wpe = WorkoutPlanExercise.find(params[:id])
      if wpe.update(workout_plan_exercise_params)
        redirect_to workout_plan_path(wpe.workout_plan)
      else
        head :no_content
      end
    end

    private

    def workout_plan_exercise_params
      params.require(:workout_plan_exercise).permit(:repetitions, :rounds, :weight)
    end
  end
end
