module RainbowStride
  class RegimenBlueprintsController < ApplicationController
    before_action :set_regimen_blueprint, only: %i[ show edit update destroy ]

    # GET /regimen_blueprints
    def index
      @regimen_blueprints = current_user.regimen_blueprints
    end

    # GET /regimen_blueprints/1
    def show
      @workouts = @regimen_blueprint.workouts

      @workout_exercise_logs = Hash.new { |h, k| h[k] = { weights: {}, repetitions: {} } }

      @workouts.each do |workout|
        workout.exercise_logs.includes(:exercise).each do |log|
          exercise_name = log.exercise.name

          @workout_exercise_logs[exercise_name][:weights][workout.start_time.to_date] = log.weight
          @workout_exercise_logs[exercise_name][:repetitions][workout.start_time.to_date] = log.repetitions
        end
      end
    end

    # GET /regimen_blueprints/new
    def new
      @regimen_blueprint = RegimenBlueprint.new
    end

    # GET /regimen_blueprints/1/edit
    def edit
    end

    # POST /regimen_blueprints
    def create
      @regimen_blueprint = current_user.regimen_blueprints.build(regimen_blueprint_params)

      if @regimen_blueprint.save
        redirect_to @regimen_blueprint, notice: "Regimen blueprint was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /regimen_blueprints/1
    def update
      if @regimen_blueprint.update(regimen_blueprint_params)
        redirect_to @regimen_blueprint, notice: "Regimen blueprint was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /regimen_blueprints/1
    def destroy
      @regimen_blueprint.destroy
      redirect_to regimen_blueprints_url, notice: "Regimen blueprint was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_regimen_blueprint
        @regimen_blueprint = RegimenBlueprint.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def regimen_blueprint_params
        params.require(:regimen_blueprint).permit(:title, :duration, exercise_ids: [])
      end
  end
end
