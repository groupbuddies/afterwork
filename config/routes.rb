Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks'}
  
  root to: 'events#index'

  resources :users do
    resources :availabilities
  end

  resources :availabilities

  resources :events do
    member do
      post :attend
      delete :cancel_attend
    end
  end

  resources :attendees

end
