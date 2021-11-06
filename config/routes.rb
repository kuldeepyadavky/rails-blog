Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  get 'posts/process_post', as: 'process_post'

  get "public/tags/:tag", to: "public#tags", :as => :tag_search

  resources :tags
  resources :categories
  resources :posts
  devise_for :users
  get 'public/index' #controller public and action index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    #resources :post
    get '/posts', to: 'posts#index'
  end



  root to: "public#index"  #adding a redirect route
end
