Rails.application.routes.draw do

  devise_for :users, controllers: {
  sessions: 'users/sessions'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#index"
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end