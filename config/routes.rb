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
    get 'posts_show_dashboards/:id', to: 'dashboards#posts_show', as: "post_show_dashboards"
    get 'stores_show_dashboards/:id', to: 'dashboards#stores_show', as: "store_show_dashboards"
    get 'edit_dashboards', to: 'dashboards#edit'
    patch 'edit_dashboards', to: 'dashboards#update' 
    get 'tagsearches/search', to: 'tagsearches#search'
    get 'users_show_dashboards/:id', to: 'dashboards#users_show', as: "user_show_dashboards"
    resources :users, only: [:destroy] 
  end
 
  get 'users/mypage'
  get 'stores/mypage'
  get 'top' => 'homes#top'
  root to: 'posts#index'
  get 'about' => 'homes#about'
  get "search" => "searches#search"
  get 'tagsearches/search', to: 'tagsearches#search'
  
  resources :stores do
    resources :favorites, only: [:create, :destroy, :index]
  end
  resources :users
  resources :store_images, only: [:new, :index, :show, :create, :destroy]
  resources :posts do
    resources :post_comments, only: [:create, :destroy, :edit]
    resource :likes, only: [:create, :destroy]
  end

end
