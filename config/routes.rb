Rails.application.routes.draw do

  devise_for :users, skip: :registrations

  root to: 'pages#home'

  get "/presentation", to: "pages#presentation", as: "presentation"

  resources :contacts, only: [ :new, :create ]
  resources :projects



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
