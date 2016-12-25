Rails.application.routes.draw do
  devise_for :users, path: ''

  resources :contacts, only: [:new, :create], path: 'contact'
  resources :posts do
    member do
      patch :publish
    end
  end
  resources :projects
  root 'pages#home'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :posts
    end
  end
end
