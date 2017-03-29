
Rails.application.routes.draw do

  
  resources :horarios
  resources :usuarios , path_names: {new: 'new/:id' }
  resources :residencias
  resources :pacientes
  resources :personas do
    collection do
    get "newEmpleado"
    get "indexEmpleado"
   end
  end

  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
