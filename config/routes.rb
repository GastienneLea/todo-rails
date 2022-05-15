Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    resources :tasks
    resources :users
    
    post '/auth/login', to: 'tokens#create'

    mount VandalUi::Engine, at: '/vandal'
  end 
end
