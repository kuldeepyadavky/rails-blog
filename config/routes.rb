Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'public/index' #controller public and action index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "public#index"  #adding a redirect route
end
