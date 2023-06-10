module RainbowStride
  class ExercisesController < ApplicationController
    before_action :set_exercise, only: %i[ show edit update destroy ]

    # GET /exercises
    def index
      @exercises = Exercise.all
    end

    # GET /exercises/1
    def show
    end

    # GET /exercises/new
    def new
      @exercise = Exercise.new
    end

    # GET /exercises/1/edit
    def edit
    end

    # POST /exercises
    def create
      @exercise = Exercise.new(exercise_params)

      if @exercise.save
        redirect_to @exercise, notice: "Exercise was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /exercises/1
    def update
      if @exercise.update(exercise_params)
        redirect_to @exercise, notice: "Exercise was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /exercises/1
    def destroy
      @exercise.destroy
      redirect_to exercises_url, notice: "Exercise was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_exercise
        @exercise = Exercise.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def exercise_params
        params.require(:exercise).permit(:name, :rainbow_stride_effort_stage_id)
      end
  end
end
