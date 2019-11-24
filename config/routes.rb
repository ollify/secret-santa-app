Rails.application.routes.draw do
  root to: 'pages#home'
  resources :pages
  resources :groups do
    post 'join_group', to: 'groups#join_group'
    post 'draw', to: 'groups#draw'
  end
  post 'approve_request', to: 'groups#approve_request'
  devise_for :users
end
