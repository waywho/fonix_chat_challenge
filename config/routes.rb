require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
	mount ActionCable.server => '/cable'
	mount Sidekiq::Web => '/sidekiq'
	
  resources :chatrooms
  devise_for :users
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
