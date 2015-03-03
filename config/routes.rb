Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks'}
  
  root to: 'events#index'

  resources :users

  resources :events do
    member do
      post :attend
    end
  end

  resources :attendees

end
