Rails.application.routes.draw do
  devise_for :users
  resources :hints
  resources :hunts
  root 'pages#home'
end
