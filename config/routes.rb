Rails.application.routes.draw do

  root 'root#index'
  get '/root/about' => 'root#about'

  devise_for :users


  resources :books
   resources :users, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
