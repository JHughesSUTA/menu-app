Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #RESTFUL ROUTES
  get "/items" => "items#index"
  get "/items/new" => "items#new"
  post "/items" => "items#create"
  get "/items/:id" => "items#show"
  get "/items/:id/edit" => "items#edit"
  patch "/items/:id" => "items#update"
  delete "/items/:id" => "items#destroy"

  post "/categories" => "categories#create"
  delete "/categories/:id" => "categories#destroy"

  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
  
  get "/carted_items" => "carted_items#index"
  post "/carted_items" => "carted_items#create"
  get "/carted_items/:id/edit" => "carted_items#edit"
  patch "/carted_items/:id" => "carted_items#update"
  delete "/carted_items/:id" => "carted_items#destroy"

  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  #NON-RESTFUL ROUTES
  get "/" => "items#menu"
  get "/menu" => "items#menu"
  get "/admin" => "items#admin"
end