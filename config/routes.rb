Rails.application.routes.draw do
  get 'homes/index'
  root to: 'homes#index'

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :books, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
