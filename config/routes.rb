Barcampgb::Application.routes.draw do
  # resources
  resources :users, :sessions, :password_resets

  resources :presentations do
    get 'attend', on: :member
    get 'unattend', on: :member
  end

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

  # pages
  get 'about' => 'pages#about'

  # custom routes
  get 'signin' => 'sessions#new'
  get 'signout' => 'sessions#destroy'

  root to: 'pages#home'
end
