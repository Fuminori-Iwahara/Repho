Rails.application.routes.draw do
  devise_for :users
 root 'photos#index'
 get 'photos' => 'photos#index'
 get 'photos/new' => 'photos#new'
 post 'photos' => 'photos#create'
 delete 'photos/:id' => 'photos#destroy'
 get 'users/:id' => 'users#show'
end
