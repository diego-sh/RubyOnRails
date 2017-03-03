<<<<<<< HEAD
Rails.application.routes.draw do
  resources :residencias
  resources :pacientes
  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
=======
Rails.application.routes.draw do
  resources :personas
  resources :pacientes
  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
>>>>>>> origin/master
