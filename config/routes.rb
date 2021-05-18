Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  
 root :to => 'homes#top'
  get 'homes/about'
  get 'orders/complete', to: 'orders#complete', as: 'complete_order'
  post 'orders/confirm', to: 'orders#confirm', as: 'confirm_order'
  resources :customers

  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end

  namespace :admin do
    resources :genres
    resources :order_details, only: [:update, :create]
    resources :orders, only: [:index, :show, :update]
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update,]
  end

  resources :products, only: [:index, :show]
  resources :cart_items
  resources :orders
  resources :shipping_addresses, only: [:new, :create, :index, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
