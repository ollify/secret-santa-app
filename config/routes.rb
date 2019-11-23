Rails.application.routes.draw do
  root to: 'pages#home'
  resources :pages
  resources :groups do
    post 'join_group', to: 'groups#join_group'
    post 'draw', to: 'groups#draw'
  end
  devise_for :users
end
