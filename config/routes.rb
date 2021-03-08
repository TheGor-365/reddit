Rails.application.routes.draw do

  devise_for :accounts
  root to: "public#index"

  resources :communities do
    resources :posts
  end

  resources :subscriptions
  resources :comments, only: [ :create ]

  post 'post/vote' => 'votes#create'

  get 'u/:username' => 'public#profile', as: :profile

end
