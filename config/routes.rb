Rails.application.routes.draw do

  devise_for :accounts
  root to: "public#index"

  resources :communities do
    resources :posts
  end

  resources :subscriptions

  get 'u/:username' => 'public#profile', as: :profile

end
