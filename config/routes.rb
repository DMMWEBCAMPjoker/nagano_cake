Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

get '/items' => 'public/items#index'

devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

root to: 'public/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'choose' => 'public/homes#choose'

  #顧客一覧
  get '/admin/customers' => 'admin/customers#index'
  get '/admin/customers/:id' => 'admin/customers#show' ,as: 'admin_customer'
  get '/admin/customers/:id/edit' => 'admin/customers#edit' ,as: 'admin_customer_edit'
  patch '/admin/customers/:id' => 'admin/customers#update', as: 'admin_customer_update'

end
