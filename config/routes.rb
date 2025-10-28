Rails.application.routes.draw do
  
  devise_for :users

  devise_for :stores, controllers: {
    registrations:  'stores/registrations',
    sessions: 'stores/sessions'
  }

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'users_dashboards', to: 'dashboards#users_index'
    get 'stores_dashboards', to: 'dashboards#stores_index'
    get 'posts_dashboards', to: 'dashboards#posts_index'
    get 'mypages_dashboards', to: 'dashboards#mypages'
    get 'posts_show_dashboards', to: 'dashboards#posts_show'
    get 'stores_show_dashboards', to: 'dashboards#stores_show'
    get 'edit_dashboards', to: 'dashboards#edit'
    patch 'edit_dashboards', to: 'dashboards#update' 
    resources :users, only: [:destroy] 
  end
 
  get 'users/mypage'
  get 'stores/mypage'
  # get 'admins/mypage'
  get 'top' => 'homes#top'
  root to: 'posts#index'
  get 'about' => 'homes#about'
  get "search" => "searches#search"
  get 'tagsearches/search', to: 'tagsearches#search'
  
  resources :stores do
    resources :favorites, only: [:create, :destroy]
    # resources :favorites, only: [:create, :destroy, :index]
  end
  resources :users
  resources :store_images, only: [:new, :index, :show, :create, :destroy]
  resources :posts do
    resources :post_comments, only: [:create, :destroy, :edit]
    resource :likes, only: [:create, :destroy]
  end
  resources :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
