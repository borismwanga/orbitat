Rails.application.routes.draw do
  devise_for :users
  root to: "spaceships#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # # root "articles#index"
  get "profile", to: "pages#profile"
  resources :users, except: [:index]
  resources :spaceships do
    resources :reservations, except: [:index, :edit, :update]
  end
end
