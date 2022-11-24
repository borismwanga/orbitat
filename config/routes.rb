Rails.application.routes.draw do
  devise_for :users
  root to: "spaceships#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # # root "articles#index"
  # get "my_spacehips", to: "spaceships#my_spaceships"
  get "profile", to: "pages#profile"
  resources :users, except: [:index]
  resources :spaceships do
    resources :reservations, except: [:index, :edit, :update]
      collection do
        get :my_spaceships
        get :my_bookings
      end
  end
end
