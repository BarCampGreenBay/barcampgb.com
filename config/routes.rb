Barcampgb::Application.routes.draw do
  # resources
  resources :users

  # pages
  get 'about' => 'pages#about'
  get 'donate' => 'pages#donate'
  root to: 'pages#home'
end
