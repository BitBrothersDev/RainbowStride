module RainbowStride
  class WorkoutsController < ApplicationController
    def index
      # @workouts = current_user.workouts.order(created_at: :desc).page(params[:page]).per(10)
      @workouts = current_user.workouts.page(params[:page]).per(10)
    end

    def new
      @workout_plans = WorkoutPlan.all
    end

    def create
      @workout = current_user.workouts.new(rainbow_stride_plan_id: params[:rainbow_stride_plan_id], start_time: Time.now)
      @workout.save!
      redirect_to workout_path(@workout)
    end

    def progress
      @user = current_user # Assuming you have a current_user method for the authenticated user

      @repetitions_by_date = ExerciseLog.joins(:exercise).where(rainbow_stride_exercises: { user_id: current_user.id }).group_by_week(:created_at).sum(:repetitions)
      @weights_by_date = ExerciseLog.joins(:exercise).where(rainbow_stride_exercises: { user_id: current_user.id }).group_by_week(:created_at).sum(:weight)

      @blueprints = current_user.workout_plans
      @blueprint_data = {}

      @blueprints.each do |blueprint|
        @blueprint_data[blueprint.title] = { reps: {}, weights: {} }

        blueprint.exercises.each do |exercise|
          @blueprint_data[blueprint.title][:reps][exercise.name] = current_user.exercise_logs
                                                                              .where(exercise: exercise)
                                                                              .group_by_day(:created_at)
                                                                              .sum(:repetitions)

          @blueprint_data[blueprint.title][:weights][exercise.name] = current_user.exercise_logs
                                                                                 .where(exercise: exercise)
                                                                                 .group_by_day(:created_at)
                                                                                 .average(:weight)
        end
      end
    end

    def show
      @workout = Workout.find(params[:id])
      @exercise_logs = @workout.exercise_logs.order('created_at DESC')
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
