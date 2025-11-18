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
    root "posts#index"
    resources :admins, only: [:edit, :update]
    get 'mypage', to: 'admins#mypage' 
    resources :posts, only: [:index, :show, :destroy] do
      member do
        get :likes
      end
    end
    resources :users, only: [:index, :show, :destroy]
    resources :stores, only: [:index, :show, :destroy] do
      member do
        get :favorites
      end
    end
    resources :post_comments, only: [:destroy]
    get 'tagsearches/search', to: 'tagsearches#search'
    get "search", to: "searches#search"
  end
 
  get 'users/mypage'
  get 'stores/mypage'
  get 'top', to: 'homes#top'
  root 'posts#index'
  get 'about', to: 'homes#about'
  get "search", to: "searches#search"
  get 'tagsearches/search', to: 'tagsearches#search'
  
  resources :stores do
    member do
      get :favorites
      get :likes
    end
    resources :favorites, only: [:create, :index]
    resource :favorites, only: [:destroy]
  end
  
  resources :users do
    member do
      get :favorites 
      get :likes
    end
  end
    
  resources :store_images, only: [:new, :index, :show, :create, :destroy]
  resources :posts do
    resources :post_comments, only: [:create, :destroy, :edit]
    resource :likes, only: [:create, :destroy]
  end

  resource :map, only: [:show]
end
