Rails.application.routes.draw do
  get 'my_snippets', to: 'snippets#my_snippets', as: :my_snippets
  get 'my_directories', to: 'directories#my_directories', as: :my_directories
  get 'snippets/my_favorites', to: 'snippets#favorites', as: :my_favorites
  resources :snippets do
    member do
      post 'add_to_directory'
      post 'save_to_directory'
      delete 'remove_from_directory'
    end
  end

  resources :directories do
    member do

      post 'add_snippet'
      post 'create_snippet', to: 'snippets#create_snippet_directory'
      get 'remove_snippet'
      get 'update_snippet'
    end
  end

  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end
