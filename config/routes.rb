Rails.application.routes.draw do
  resources :reservations
  resources :class_subjects
  resources :users
  post 'login', to 'sessions#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
