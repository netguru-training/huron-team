Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :bars
  resources :geek_beers
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

end
