Barcampgb::Application.routes.draw do
  # resources
  resources :users, :sessions, :password_resets

  resources :presentations do
    get 'attend', on: :member
  end

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

  # pages
  get 'about' => 'pages#about'
  root to: 'pages#home'
end
