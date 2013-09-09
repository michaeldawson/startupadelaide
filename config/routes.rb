Map::Application.routes.draw do

  get "ajax/tweets"
  get "ajax/mentions"

  get "static/index"

  root :to => 'static#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :categories

  post '/post' => 'static#post'

  namespace :admin do
    post 'upload' => 'nodes#upload', as: :import_nodes
  end
end
