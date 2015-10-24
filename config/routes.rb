Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :bars
  resources :locals

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')

end
