# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations',
               passwords: 'passwords'

             }

  resources :hints, except: [:show] do
    collection do
      patch :sort
    end
  end

  resources :hunts
  get '/home', to: 'pages#home'
  get '/help', to: 'pages#help'
  get '/privacy-policy', to: 'pages#privacy_policy'
  get '/users', to: redirect('/home')
  get '/hunt', to: 'hunts#show_by_key'

  root 'pages#home'
end
