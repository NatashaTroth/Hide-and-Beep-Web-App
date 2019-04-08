Rails.application.routes.draw do
  resources :hints
  resources :hunts
  get '/home', to: 'pages#home'

  root 'pages#home'

end
