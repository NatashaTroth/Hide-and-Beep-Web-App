Rails.application.routes.draw do
  devise_for :users,
    :controllers => {
      :sessions => "sessions",
      :registrations => "registrations",
      :passwords => "passwords"

    }
  resources :hints, :except => [:show]
  resources :hunts
  get '/home', to: 'pages#home'
  get '/help', to: 'pages#help'


  #root :to => redirect("/users/sign_in")

  root 'pages#home'
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

end
