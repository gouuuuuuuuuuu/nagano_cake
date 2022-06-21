Rails.application.routes.draw do
  # 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :public do
    resources :items
    resources :addresses
    get "customers/show" => "customers#show"
    get "customers/confirmation" => "customers#confirmation"
    patch "customers/withdrawal" => "customers#withdrawal"
    resource :customers, only: [:edit, :update]
    resources :cart_items do
    collection do
    delete 'destroy_all'
    end
  end

    resources :orders do
    collection do
    get 'completion'
    post 'confirmation'
  end
end
end
  namespace :admin do
    resources :genres
    resources :items
    resources :customers
    resources :orders 
    resources :order_details, only: [:update]
  end
  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
get '/public' => 'public/homes#top'
get '/about' => 'public/homes#about',as:'about'

 get '/admin' => 'admin/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
