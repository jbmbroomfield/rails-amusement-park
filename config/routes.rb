Rails.application.routes.draw do
  
  root 'pages#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]

end
