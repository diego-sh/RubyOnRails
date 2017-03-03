
Rails.application.routes.draw do
  get 'personarol/index'

  get 'personarol/new'

  get 'personarol/create'

  get 'personarol/update'

  resources :residencias
  resources :pacientes
  resources :personas
  resources :personarol
  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
