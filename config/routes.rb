Rails.application.routes.draw do
  root to: 'pages#home'

  resources :groups do
    resources :participants
  end
end
