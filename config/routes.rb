Rails.application.routes.draw do
  devise_for :users, path: ''
  resources :posts do
    member do
      patch :publish
    end
  end
  resources :projects
  resources :contacts, only: [:new, :create], path: "contact"
  root 'pages#home'
  get 'pages/home'

end
