Rails.application.routes.draw do


resources :login, only: [:create]
resources :employees
resources :users, only: [:create]
resources :bills
resources :admin_bills, only: [:update, :index]
end
