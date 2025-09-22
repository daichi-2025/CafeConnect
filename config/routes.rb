Rails.application.routes.draw do
  get 'stores/index'
  get 'stores/show'
  get 'stores/create'
  get 'stores/mypage'
  get 'stores/destroy'
  get 'stores/update'
  get 'stores/edit'
  devise_for :stores
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :stores, only: [:mypage, :create, :edit, :index,]
  resources :store_images, only: [:new, :index, :show, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
