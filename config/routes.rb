Rails.application.routes.draw do

#　管理者側のルーティング
  namespace :admin do
    resources :bookings
    resources :hotels do # Good ^_^
      resources :rooms
    end
    resources :rooms # No Good T_T
    resources :customers, only: [:index, :show, :destroy]
    resources :reviews
    get 'customers/unsubscribe'
  end

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:passwords] ,controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}

# 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'
    get 'sessions/new' => 'sessions#new'
    get 'customers/mypage' => 'customers#mypage'
    get 'search' => 'searches#search'
    post 'bookings/confirm' => 'bookings#confirm'
    get 'bookings/thanks' => 'bookings#thanks'
    post 'bookings' => 'bookings#create'

    resources :customers
    resources :hotels
    resources :bookings
# コメント機能のネスト部分
    resources :hotels do
     resources :comments, only: [:create, :destroy]
    end
  end

    resources :rooms do
     resources :bookings
  end

# ゲストログイン
  devise_scope :customer do
    post "customers/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
