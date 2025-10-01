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
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :stores
  resources :users
  resources :store_images, only: [:new, :index, :show, :create, :destroy]
  resources :posts do
    resources :post_comments, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
