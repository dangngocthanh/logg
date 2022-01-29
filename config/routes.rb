Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get 'register' ,to: 'users#new'
  post 'register' ,to: 'users#create'

  get     "login"    => "sessions#new"
  post    "login"    => "sessions#create"
  post  "logout"   => "sessions#destroy"
  get  "logout"   => "devise/sessions#logout"
end
