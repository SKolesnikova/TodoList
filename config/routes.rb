Rails.application.routes.draw do
  resources :todos, only: [:index, :update, :create, :destroy]
  get 'completed', to: 'todos#completed'
  get 'uncompleted', to: 'todos#uncompleted'
  root "todos#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
