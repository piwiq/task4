Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  #↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
  resources :books, only:[:create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end


  #get 'users/index'
  #get 'users/show'
  #get 'users/edit'
  resources :users, only:[:index,:show, :edit, :update]

  #resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
