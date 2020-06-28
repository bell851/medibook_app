Rails.application.routes.draw do
  get 'admins/new'
  devise_for :admins
  root 'pages#index'
  get 'pages/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
