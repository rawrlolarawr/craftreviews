Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  
  resources :users, only: [:edit, :update, :show]
  resources :breweries do
    resources :beers
  end
  
  root to: "welcome#index"
end
