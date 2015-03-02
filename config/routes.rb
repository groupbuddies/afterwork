Rails.application.routes.draw do

  root to: 'events#index'

  resources :events
  
  resources :users do
    resources :attendees
  end
end
