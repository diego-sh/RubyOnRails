Rails.application.routes.draw do
 
  devise_for :users
  #get 'welcome/index'
=begin
    RUTAS  A LAS QUE SE VA A ASOCIAR LAS PAGINA DE LA APICACION
    puede tener only(create,edit) u exept(delete)
=end
  resources :articles do
   resources :comentarios, only: [:create, :destroy, :update]
  end
=begin    
    get "/articles"
    post "/articles"
    delete "/articles/:id" destroy
    get "/articles/:id"
    get "/articles/new"
    get "/articles/:id/edit"
    patch "/articles/:id"
=end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
