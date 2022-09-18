Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 devise_for :users
 root to: "homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only:[:create, :destroy]
    resource :book_comments, only:[:create]
  end
  resources :book_comments, only: [:destroy]
  resources :users, only: [:index,:show,:edit,:update]

end
