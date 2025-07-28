Rails.application.routes.draw do
  devise_for :users

  resources :rooms do
    resources :reservations, only: [:new, :create, :edit, :destroy, :show, :index]
  end

  resources :users do
    resources :reservations, only: [:index]
    resources :rooms, only: [:index], controller: 'users/rooms'
    member do
      get :show_edit
      get :profile
      get :account_edit
      get :account
    end
  end

  get 'reservation/complete', to: 'reservations#complete', as: 'reservation_complete'

  root 'rooms#index'
end
