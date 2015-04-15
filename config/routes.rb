Todo::Application.routes.draw do
  resources :users do 
    resources :lists, except: [:index]
  end

  resources :lists, only: [] do
    resources :items, only: [:create, :new]
  end

  resources :items, only: [:destroy]

  root to: 'items#new'
  
  namespace :api, defaults: { format: :json } do
     resources :users
   end
end
