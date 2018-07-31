Rails.application.routes.draw do
  resources :frnds
  get 'friendships/create'
  get 'friendships/update'
  get 'friendships/destroy'
  
  devise_for :users
  get 'welcome/index'
 resources :fusers
  root 'welcome#index'
  resources :friendships, only: [:create, :update, :destroy]
  get 'friendships/frnd'
  get 'friendships/myfrnd'
   get 'friendships/myprofile'
 resources :users
  match '/auth/:provider/callback', :to => 'sessions#facebook',  via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]

end
