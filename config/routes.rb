Rails.application.routes.draw do
  devise_for :users,
    :controllers => {
      :sessions => "sessions",
      :registrations => "registrations",
      :passwords => "passwords"

    }

    
    resources :hints, :except => [:show] do
    collection do
      patch :sort
    end
  end

  resources :hunts
  get '/home', to: 'pages#home'
  get '/help', to: 'pages#help'
  get '/privacy_policy', to: 'pages#privacy_policy'
  get '/huntsJson.json', to: 'hunts#indexJson' 
  get '/users', to: redirect("/home")
  get '/hunt', to: 'hunts#showByKey'


  #root :to => redirect("/users/sign_in")

  root 'pages#home'
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

end
