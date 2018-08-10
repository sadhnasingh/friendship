Rails.application.routes.draw do
  resources :frnds
  get 'friendships/create'
  get 'friendships/update'
  get 'friendships/destroy'
  
  devise_for :users
  get 'welcome/index'
  resources :fusers
  root 'welcome#index'
  resources :friendships, only: [:create, :update, :destroy] do
     resources :comments
     end
  get 'friendships/frnd'
  get 'friendships/myfrnd'
  get 'friendships/myprofile'
  get 'friendships/pending'
  get 'mygalleries/gallery'
  post 'mygalleries/create_gallery'
  get 'conversations/index'
  resources :personal_messages, only: [:create, :new]
resources :conversations, only: [:index, :show]
  
resources :users do
   
   member do
      get 'friendships/friendprofile' => 'friendships#friendprofile'
      get 'friendships/friendimage' => 'friendships#friendimage'
      get 'mygalleries/friendgallery' => 'mygalleries#friendgallery'

   
    end
end
  match '/auth/:provider/callback', :to => 'sessions#facebook',  via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]

end
