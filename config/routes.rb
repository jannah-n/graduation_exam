Rails.application.routes.draw do
  get "quizzes/index"
  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create", as: :sessions_create
  delete "logout", to: "sessions#destroy", as: :logout
  resources :users, only: [ :new, :create ]
  resources :quizzes, only: [ :index ]
  get "home/index"
  root "home#index" # トップページに戻るための設定
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
