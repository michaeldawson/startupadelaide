Map::Application.routes.draw do

  resources :blog_posts

  resources :contact_messages, only: [:create]

  root :to => 'static#index'

  controller :static do
    get "about", as: :about
    get "blog", as: :blog
    get "contact", as: :contact
    get "search", as: :search
    get "explore", as: :explore
    get "index"
  end

  get "ajax/tweets"
  get "ajax/mentions"

  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :categories

  namespace :admin do
    post 'upload' => 'nodes#upload', as: :import_nodes
  end
end
