module RainbowStride
  class WorkoutPlansController < ApplicationController
    before_action :set_workout_plan, only: %i[ show edit update destroy ]

    # GET /workout_plans
    def index
      @workout_plans = current_user.workout_plans
    end

    # GET /workout_workout_plans/1
    def show
      @workouts = @workout_plan.workouts

      @workout_exercise_logs = Hash.new { |h, k| h[k] = { weights: {}, repetitions: {} } }

      # @workouts.each do |workout|
      #   workout.exercise_logs.includes(:exercise).each do |log|
      #     exercise_name = log.exercise.name
      #
      #     @workout_exercise_logs[exercise_name][:weights][workout.start_time.to_date] = log.weight
      #     @workout_exercise_logs[exercise_name][:repetitions][workout.start_time.to_date] = log.repetitions
      #   end
      # end
    end

    # GET /workout_plans/new
    def new
      @workout_plan = WorkoutPlan.new
      @levels_with_exercises = Level.includes(:exercises).each_with_object({}) do |level, hash|
        hash[level] = level.exercises
      end
    end

    # GET /workout_plans/1/edit
    def edit
    end

    # POST /workout_plans
    def create
      @workout_plan = current_user.workout_plans.build(workout_plan_params)

      if @workout_plan.save
        redirect_to @workout_plan, notice: "Level was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /workout_plans/1
    def update
      if @workout_plan.update(workout_plan_params)
        redirect_to @workout_plan, notice: "Level was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /workout_plans/1
    def destroy
      @workout_plan.destroy
      redirect_to workout_plans_url, notice: "Level was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_workout_plan
        @workout_plan = WorkoutPlan.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def workout_plan_params
        params.require(:workout_plan).permit(:title, :duration, exercise_ids: [])
      end
  end
end
