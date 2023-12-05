Rails.application.routes.draw do
  resources :likes

  get 'snippets/my_favorites', to: 'snippets#favorites', as: :my_favorites

  resources :snippets do
    post "new_like" , to: 'likes#new_like'

    member do
      post 'add_to_directory'
      post 'save_to_directory'
    end
  end

  get "likes_index" , to: 'likes#likes_index'
  resources :directories do
    member do
      post 'add_snippet'
    end
  end

  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
