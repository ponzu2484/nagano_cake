Rails.application.routes.draw do
  #顧客用
  #URL/customers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :customers, except: [:index, :destroy, :new, :create]
    post 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    resources :cart_items, except: [:new, :show, :edit]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, except: [:edit, :update, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/completion' => 'orders#completion'
    resources :addresses, except: [:new, :show]
  end
  
  #管理者用
  #URL/admins/sign_in...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
