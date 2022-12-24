Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  #デバッグ用 GETメソッドサインアウト(users)
  devise_scope :user do
    get "users/sign_out", to: "public/sessions#destroy"
  end

  #デバッグ用 GETメソッドサインアウト(admin)
  devise_scope :admin do
    get "admin/sign_out", to: "admin/sessions#destroy"
  end
  
  scope module: :public do
    root to: "homes#top"
    get "about", to: "homes#about"
  end

  namespace :admin do
    get "/", to: "homes#top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
