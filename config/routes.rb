Rails.application.routes.draw do
  resources :hints
  resources :hunts
  root 'pages#home'
end
