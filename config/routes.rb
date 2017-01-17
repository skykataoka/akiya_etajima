Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'top#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  resource :user, only: [:show, :edit, :update]
  get :mypage, to: 'users#show'
  
  resources :houses do
    resources :favorites , only: [:create, :destroy]
  end
  
end
