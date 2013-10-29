Barcampgb::Application.routes.draw do
  # resources
  resources :users, :sessions, :presentations, :password_resets

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

  # pages
  get 'about' => 'pages#about'
  root to: 'pages#home'
end
