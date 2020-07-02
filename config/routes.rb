Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/show'
  devise_for :admins, controllers: { registrations: 'admins/registrations',
  sessions: 'admins/sessions', passwords: 'admins/passwords' }
  resources :admins, :only => [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
