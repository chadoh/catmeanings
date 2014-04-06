CatMeanings::Application.routes.draw do

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end
  mount Sidekiq::Web => '/sidekiq'

  get 'signup', to: 'users#new', as: 'signup'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, except: :index
  resources :password_resets, except: [:index, :show, :destroy]

  resources :cats
  resources :comments, only: [:create, :edit, :update, :destroy]

  root to: 'cats#index'
end
