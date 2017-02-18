Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
