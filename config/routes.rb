Rails.application.routes.draw do
  resources :chatrooms
  devise_for :users
  resources :messages
  get '/users' => 'chatrooms#index', as: :user_root
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
