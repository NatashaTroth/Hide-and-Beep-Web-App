Rails.application.routes.draw do
  devise_for :users,
    :controllers => {
      :sessions => "sessions",
      :registrations => "registrations",
      :passwords => "passwords"

    }
  resources :hints
  resources :hunts
  get '/home', to: 'pages#home'

  #root :to => redirect("/users/sign_in")

  root 'pages#home'
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

end
