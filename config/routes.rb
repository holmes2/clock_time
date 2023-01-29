Rails.application.routes.draw do
  resources :users do
    get 'shifts/end', to: 'shifts#end_shift'
    get 'shifts/start', to: 'shifts#new'
    resources :shifts, only: [:show, :index] do
      resources :breaks, only: [:create, :index, :update, :show, :new]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
