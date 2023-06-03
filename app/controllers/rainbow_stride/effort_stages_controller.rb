module RainbowStride
  class EffortStagesController < ApplicationController
    before_action :set_effort_stage, only: %i[ show edit update destroy ]

    # GET /effort_stages
    def index
      @effort_stages = EffortStage.all
    end

    # GET /effort_stages/1
    def show
    end

    # GET /effort_stages/new
    def new
      @effort_stage = EffortStage.new
    end

    # GET /effort_stages/1/edit
    def edit
    end

    # POST /effort_stages
    def create
      @effort_stage = EffortStage.new(effort_stage_params)

      if @effort_stage.save
        redirect_to @effort_stage, notice: "Effort stage was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /effort_stages/1
    def update
      if @effort_stage.update(effort_stage_params)
        redirect_to @effort_stage, notice: "Effort stage was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /effort_stages/1
    def destroy
      @effort_stage.destroy
      redirect_to effort_stages_url, notice: "Effort stage was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_effort_stage
        @effort_stage = EffortStage.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def effort_stage_params
        params.require(:effort_stage).permit(:name)
      end
  end
end
