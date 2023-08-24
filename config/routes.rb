# frozen_string_literal: true

RainbowStride::Engine.routes.draw do
  resources :workout_plan_exercises, only: %i[update destroy]
  resources :workout_plans
  resources :levels
  resources :exercises
  resources :measurements
  get :generate_svg, to: 'home#generate_svg'
  resources :workouts, only: %i[index show new create] do
    get 'progress', on: :collection
    resources :exercise_logs, only: %i[create update]
    member do
      get ':id/finish', to: 'workouts#finish', as: 'finish'
    end
  end
end
