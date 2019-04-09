Rails.application.routes.draw do
  devise_for :users
  resources :hints
  resources :hunts
  get '/home', to: 'pages#home'

  root 'pages#home'
end
