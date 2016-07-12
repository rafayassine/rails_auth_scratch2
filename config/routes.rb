Rails.application.routes.draw do
  root 'pages#home'


  resources :posts
  resource :users
  get 'signup' => 'users#new'
end
