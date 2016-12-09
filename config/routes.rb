Rails.application.routes.draw do
  devise_for :users
  
  resource :search, only: [:show, :create]
  # resource :ticket, only: [:show, :create, :new]
  resources :tickets

  namespace :admin do
    resources :railway_stations do
      patch :update_station_order, on: :member
      patch :update_time, on: :member
    end

    resources :trains do
      resources :cars, shallow: true
    end

    resources :routes
    resources :tickets
  end

  get 'welcome/index'
  root 'welcome#index'
end
