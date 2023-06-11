RainbowStride::Engine.routes.draw do
  resources :regimen_blueprints
  resources :effort_stages
  resources :exercises
  resources :workouts, only: [:index, :show, :new, :create] do
    resources :exercise_logs, only: [:create, :update]
    member do
      get ':id/finish', to: 'workouts#finish', as: 'finish'
    end
  end
end
