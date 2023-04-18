Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
resources :cart_items, only:[:index, :update, :destroy, :create]
delete 'cart_items/destroy_all' => 'cart_items#destroy_all',as: 'destroy_all'
get 'cart_items/index' => 'cart_items#index'
resources :orders, only:[:new, :create, :index, :show]
post 'orders/check' => 'ordes#check', as: 'check'
get 'orders/complete' => 'orders#complete', as: 'complete'
resources :deliveries, only:[:index, :edit, :create, :update, :destroy]

devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

root to: 'public/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'choose' => 'public/homes#choose'
end
