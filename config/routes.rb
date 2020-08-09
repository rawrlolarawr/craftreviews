Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  
  resources :users, only: [:edit, :update, :show]
  
  root to: "welcome#index"
end
