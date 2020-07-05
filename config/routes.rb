Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  devise_for :admins, controllers: { registrations: 'admins/registrations',
  sessions: 'admins/sessions', passwords: 'admins/passwords', confirmations: 'admins/confirmations' }
  devise_scope :admin do
    patch "admins/confirmation", to: "admins/confirmations#confirm"
  end
  resources :admins, only: [:index]
  resources :books, only: [:index, :new, :edit, :destroy, :update, :create]
end
