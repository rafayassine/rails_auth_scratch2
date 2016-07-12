Rails.application.routes.draw do
  root 'pages#home'
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
  resources :posts
  resource :users

end
