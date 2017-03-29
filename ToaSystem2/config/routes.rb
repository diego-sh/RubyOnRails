
Rails.application.routes.draw do

  
<<<<<<< HEAD
=begin  get 'consultas', to: 'consultas#index', as: 'consultas'
  get 'consultas/:id/edit', to: 'consultas#edit', as: 'edit_consulta'
  get 'consultas/new'
  get 'consultas/create'
  get 'consultas/update'
=end
  resources :consultas
=======
  resources :citas
  resources :horarios
>>>>>>> origin/master
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
