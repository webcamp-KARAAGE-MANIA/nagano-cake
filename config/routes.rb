Rails.application.routes.draw do

  get 'cards/new'
  get 'search/search'
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
    get '/search', to: 'searchs#search'
  end

  resources :products, only: [:index, :show] do
    resources :favorites, only: [:create, :destroy, :index]
  end

  resources :cart_items do
    collection do
    delete 'destroy_all'
   end
  end

  resources :orders do
    collection do
      post :confirm
      get :complete
    end
  end
  resources :shipping_addresses, only: [:new, :create, :index, :edit, :update, :destroy]

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :customers, only: [:show, :edit, :update] do
    member do
      patch 'hide'
      get 'confirm'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
