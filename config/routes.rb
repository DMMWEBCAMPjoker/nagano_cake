Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  #publicカートアイテム
delete 'cart_items/destroy_all' => 'cart_items#destroy_all',as: 'destroy_all'
resources :cart_items, only:[:index, :update, :destroy, :create]

  #publicオーダー
get 'orders/complete' => 'orders#complete', as: 'complete'
post 'orders/check' => 'orders#check', as: 'check'
resources :orders, only:[:new, :create, :index, :show]



get '/items' => 'public/items#index'
get '/items/:id' => 'public/items#show', as: 'items_show'


devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  #トップページ
  root to: 'public/homes#top'
  get 'homes/about' => 'public/homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'choose' => 'public/homes#choose'

  #publicマイページ
  get '/customers/my_page' => 'public/customers#show'
  get '/customers/infomation/edit' => 'public/customers#edit'
  patch '/customers/infomation' => 'public/customers#update'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe'
  patch '/customers/withdrow' => 'public/customers#withdrow'

  #public配送先
  delete '/deliveries/:id' => 'public/deliveries#destroy', as: 'deliveries_destroy'
  get '/deliveries' => 'public/deliveries#index', as: 'deliveries_index'
  get '/deliveries/:id/edit' => 'public/deliveries#edit', as: 'deliveries_edit'
  post '/deliveries' => 'public/deliveries#create', as: 'deliveries_create'
  patch '/deliveries/:id' => 'public/deliveries#update', as: 'deliveries_update'




  #顧客一覧
  get '/admin/customers' => 'admin/customers#index'
  get '/admin/customers/:id' => 'admin/customers#show' ,as: 'admin_customer'
  get '/admin/customers/:id/edit' => 'admin/customers#edit' ,as: 'admin_customer_edit'
  patch '/admin/customers/:id' => 'admin/customers#update', as: 'admin_customer_update'

  #商品
  get '/admin/items/new' => 'admin/items#new'
  get '/admin/items/:id' => 'admin/items#show' ,as: 'admin_item_show'
  get '/admin/items' => 'admin/items#index' ,as: 'admin_item_index'
  post '/admin/items' => 'admin/items#create'
  get 'admin/items/:id/edit' => 'admin/items#edit' ,as: 'admin_item_edit'
  patch '/admin/items/:id' => 'admin/items#update' ,as: 'admin_item_update'

  #ジャンル
  get '/admin/genres' => 'admin/genres#index'
  post '/admin/genres' => 'admin/genres#create', as: 'admin_genres_create'
  get '/admin/genres/:id/edit' => 'admin/genres#edit', as: 'admin_genres_edit'
  patch '/admin/genres/:id' => 'admin/genres#update', as: 'admin_genres_update'

  #adminオーダー
  get '/admin/orders' => 'admin/orders#index'
  get '/admin/orders/:id' => 'admin/orders#show', as: 'admin_orders_show'
  patch '/admin/orders/:id' => 'admin/orders#update', as: 'admin_orders_update'
  patch '/admin/order_items/:id' => 'admin/order_items#update', as: 'admin_order_items_update'



end
