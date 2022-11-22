Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "reservations/new", to: "reservations#new", as: :new_reservation
  post "reservations", to: "reservations#create"
  get "reservations/:id", to: "reservations#show", as: :reservation
  patch "reservations/:id", to: "reservations#update"
  delete "reservations/:id", to: "reservations#destroy"

  resources :users
  resources :spaceships
end
