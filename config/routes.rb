Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  get 'password_resets/new'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  root 'boards#index'
  post 'guest_login', to: 'user_sessions#guest_login'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  
  resources :boards do
    resources :comments, only: %i[create destroy], shallow: true
    collection { get :search }
    collection do
      get :bookmarks
      end
  end
  
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
end
