Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :users, only: [:edit, :update, :show]

  resources :breweries do
    resources :beers 
  end

  resources :beers do
    resources :reviews
  end

  post '/results', to: 'welcome#results'

  root to: "welcome#index"
end