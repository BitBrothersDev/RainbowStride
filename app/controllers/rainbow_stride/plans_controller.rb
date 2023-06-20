module RainbowStride
  class PlansController < ApplicationController
    before_action :set_plan, only: %i[ show edit update destroy ]

    # GET /plans
    def index
      @plans = current_user.plans
    end

    # GET /plans/1
    def show
      @workouts = @plan.workouts

      @workout_exercise_logs = Hash.new { |h, k| h[k] = { weights: {}, repetitions: {} } }

      @workouts.each do |workout|
        workout.exercise_logs.includes(:exercise).each do |log|
          exercise_name = log.exercise.name

          @workout_exercise_logs[exercise_name][:weights][workout.start_time.to_date] = log.weight
          @workout_exercise_logs[exercise_name][:repetitions][workout.start_time.to_date] = log.repetitions
        end
      end
    end

    # GET /plans/new
    def new
      @plan = Plan.new
    end

    # GET /plans/1/edit
    def edit
    end

    # POST /plans
    def create
      @plan = current_user.plans.build(plan_params)

      if @plan.save
        redirect_to @plan, notice: "Level was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /plans/1
    def update
      if @plan.update(plan_params)
        redirect_to @plan, notice: "Level was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /plans/1
    def destroy
      @plan.destroy
      redirect_to plans_url, notice: "Level was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_plan
        @plan = Plan.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def plan_params
        params.require(:plan).permit(:title, :duration, exercise_ids: [])
      end
  end
end
