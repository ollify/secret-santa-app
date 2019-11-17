Rails.application.routes.draw do
  root to: 'pages#home'
  resources :pages
  resources :groups
  devise_for :users
end
