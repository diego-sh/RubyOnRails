
Rails.application.routes.draw do
  resources :residencias
  resources :pacientes
  resources :personas
  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
