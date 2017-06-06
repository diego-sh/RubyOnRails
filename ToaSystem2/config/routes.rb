
Rails.application.routes.draw do

=begin  get 'consultas', to: 'consultas#index', as: 'consultas'
  get 'consultas/:id/edit', to: 'consultas#edit', as: 'edit_consulta'
  get 'consultas/new'
  get 'consultas/create'
  get 'consultas/update'
=end
  resources :consultas do
    collection do
      post "createAntecedente"
      post "createConsulta"
      post "createSintoma"
      post "createExamenFisico"
      post "createPedido"
      post "createTratamiento"
      post "createReceta"
      post "createTerapia"
      post "createEmergencia"
      
    end
  end
  
  resources :citas  
  resources :horarios
  resources :usuarios , path_names: {new: 'new/:id' } do
    collection do
      get "login"
      post "login"
      post "logout"
    end
    
  end
  
  resources :residencias
  resources :pacientes do
    resources :antecedentes
  end
  
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
