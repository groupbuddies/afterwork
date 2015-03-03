Rails.application.routes.draw do

  devise_for :users
  root to: 'events#index'

  resources :events
  
  resources :users do
    resources :attendees
  end
end
