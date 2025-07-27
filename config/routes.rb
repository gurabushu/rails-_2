Rails.application.routes.draw do
  devise_for :users
  
  resources :rooms
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :rooms do
    resources :reservations, only: [:new, :create, :edit, :destroy, :show]
  end

  get 'reservation/complete', to: 'reservations#complete', as: 'reservation_complete'

  root 'rooms#index'
  
end
