RainbowStride::Engine.routes.draw do
  resources :plans
  resources :levels
  resources :exercises
  resources :workouts, only: [:index, :show, :new, :create] do
    get 'progress', on: :collection
    resources :exercise_logs, only: [:create, :update]
    member do
      get ':id/finish', to: 'workouts#finish', as: 'finish'
    end
  end
end
