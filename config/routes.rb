Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'top#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  resource :user, only: [:show, :edit, :update] do
    resources :messages
  end
  get :mypage, to: 'users#show'
  
  resources :houses do
    resources :favorites , only: [:create, :destroy]
  end
end
