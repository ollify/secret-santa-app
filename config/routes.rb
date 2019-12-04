Rails.application.routes.draw do
  root to: 'pages#home'
  resources :pages
  resources :groups do
    post 'join_group', to: 'groups#join_group'
    post 'draw', to: 'groups#draw'
    post 'send_receiver', to: 'groups#send_receiver'
    post 'undo_draw', to: 'groups#undo_draw'
  end
  post 'approve_request', to: 'groups#approve_request'
  post 'decline_request', to: 'groups#decline_request'
  post 'white_label_user', to: 'groups#white_label_user'


  devise_for :users
  get 'legal', to: 'pages#legal'
end
