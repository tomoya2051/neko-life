Rails.application.routes.draw do
  namespace :public do
    get 'questions/index'
    get 'questions/new'
    get 'questions/show'
  end
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get "about"=>"homes#about"
    resources :customers, only: [:show, :edit, :update]
    get "customers/:id/confirm"=>"customers#confirm"
    patch "customers/:id/withdraw"=>"customers#withdraw"
    resources :diaries do
      resources :diary_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    resources :questions, only: [:index, :new, :create, :show, :destroy] do
      resources :answer, only: [:new, :create]
    end
    post "questions/preview"=>"questions#preview"
  end

  namespace :admin do
    get  "/"=>"homes#top"
    resources :diaries, only: [:index, :edit, :update, :destroy]
    resources :questions, only: [:index, :edit, :update, :destroy]
    resources :customers, only: [:show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end