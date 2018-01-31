Rails.application.routes.draw do
  resources :working_titles
  root 'working_titles#index'
end
