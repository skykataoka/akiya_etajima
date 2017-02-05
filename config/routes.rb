Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'top#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  resources :users, only: [:index, :show, :edit, :update]
  get :mypage, to: 'users#show'
  
  resources :houses, only: [:index, :show] do
    resources :favorites , only: [:create, :destroy]
  end

  resources :conversations do
    collection do
      resources :messages, only: [:index, :create, :edit, :update, :destroy]
    end
  end

  scope module: :admin do
    resources :conversations
  end
end
