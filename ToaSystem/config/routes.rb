Rails.application.routes.draw do
  resources :appointments
  get 'welcome/index'
  root 'welcome#index'
  resources :patients
  resources :appointments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
