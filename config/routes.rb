Rails.application.routes.draw do
  get 'tweet/timeline'

  get 'sessions/index'
  post 'sessions/index'

  root 'home#index'
  get 'home/index'

  #twitter routes
  get '/tweet', to: 'tweet#timeline'
  get 'signout_twitter', to: 'sessions#destroy'

  #oauth routes
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
