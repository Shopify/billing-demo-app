Rails.application.routes.draw do

  controller :sessions do
    get 'login' => :new, :as => :login
    post 'login' => :create, :as => :authenticate
    get 'auth/shopify/callback' => :callback
    get 'logout' => :destroy, :as => :logout
  end

  root :to => 'home#index'

  resources :application_charges, only: [:index, :create] do
    member do
      post :activate
    end
  end

  resource :recurring_application_charge, only: [:show, :create, :destroy] do
    collection do
      get :callback
      post :customize
    end
  end

  resource :usage_charge, only: [:show, :create]
end
