
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
      post "buscarPaciente"
      post "createParteOperatorio"
      get "pdfTerapia"
      get "pdfReceta"
      post "finalizarConsulta"
      post "finalizarConsultaEmergencia"      
    end
  end
  
  resources :citas do
    collection do
      post "buscarPaciente"
    end    
  end
   
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

  resources :cirugias do
    collection do
      post "createIngreso"
    end
  end
  
  resources :ingresos do
    collection do
      post "createEnfermeriaNota"
      post "createNotaEvolucion"
      post "createSignosVitales"
      post "createExamenCardiologico"
    end
  end
  

  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
