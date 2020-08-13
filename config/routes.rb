Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :users, only: [:edit, :update, :show]

  resources :breweries do
    resources :beers 
  end

  resources :beers do
    resources :reviews
  end

  root to: "welcome#index"
end