Rails.application.routes.draw do
  resources :users do
    resources :shifts, only: [:create, :index, :update, :show] do
      resources :breaks, only: [:create, :index, :update, :show]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
