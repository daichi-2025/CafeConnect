Rails.application.routes.draw do
  
  devise_for :users

  devise_for :stores, controllers: {
    registrations:  'stores/registrations',
    sessions: 'stores/sessions'
  }

  devise_for :admins, controllers: {
    registrations:  'admins/registrations',
    sessions: 'admins/sessions'
  }
 
  get 'users/mypage'
  get 'stores/mypage'
  get 'admins/mypage'
  get 'top' => 'homes#top'
  root to: 'posts#index'
  get 'about' => 'homes#about'
  get "search" => "searches#search"
  resources :stores do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
  resources :store_images, only: [:new, :index, :show, :create, :destroy]
  resources :posts do
    resources :post_comments, only: [:create]
    resource :likes, only: [:create, :destroy]
  end
  resources :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
