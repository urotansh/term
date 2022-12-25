Rails.application.routes.draw do

  #ゲストログイン用ルーティング
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  
  # 管理者機能
  namespace :admin do
    get "/", to: "homes#top"
    
    # ユーザー管理機能
    resources :users, param: :name, only: [:index, :show, :edit, :update]
  end
  
  
  # ユーザー機能
  scope module: :public do
    root to: "homes#top"
    get "about", to: "homes#about"
    
    # ユーザー設定機能
    resources :users, param: :name, path: '/', only: [:show] do
      collection do
        get   "settings/profile", to: "users#edit"
        patch "settings/profile", to: "users#update"
        get   "quit",             to: "users#quit"
        patch "withdraw",         to: "users#withdraw"
      end
    end
    
    # 投稿機能
    resources :notes
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
