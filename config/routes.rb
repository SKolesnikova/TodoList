Rails.application.routes.draw do

  devise_for :users

  resources :lists do
    member do
      get 'completed'
      get 'uncompleted'
      delete 'completed'
    end
  end

  resources :todos, only: [:index, :update, :create, :destroy]

  root "lists#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
