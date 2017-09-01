Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "users/new"
  get "accounts/index"

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :users
  resources :sessions
  resources :documents
  resources :accounts do
  	resources :transactions
  	get 'bill' => "accounts#bill"
  end

  resources :transactions do
    post 'approve'
  end



end
