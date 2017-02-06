Rails.application.routes.draw do
  devise_for :users
  resources :todos, only: [:index, :update, :create, :destroy]
  get 'completed', to: 'todos#completed'
  get 'uncompleted', to: 'todos#uncompleted'
  delete 'completed', to: 'todos#delete_all'
  root "todos#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
