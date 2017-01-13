Rails.application.routes.draw do
  root 'top#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resource :user, only: [:show, :edit, :update]
  get :mypage, to: 'users#show'
  
  resources :houses do
    resources :favorites , only: [:create, :destroy]
  end
  
end
