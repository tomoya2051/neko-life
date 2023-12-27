Rails.application.routes.draw do
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
    get "customers/:id/confirm"=>"customers#confirm"
    resources :customers, only: [:show, :edit, :update]
    patch "customers/:id/withdraw"=>"customers#withdraw"
    resources :diaries do
      resources :diary_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    resources :questions, only: [:index, :new, :create, :show, :destroy] do
      resources :answers, only: [:new, :create]
    end
    post "questions/preview"=>"questions#preview"
  end

  namespace :admin do
    get  "/"=>"homes#top"
    get 'diaries/:id/index_diaries_user' => 'diaries#index_diaries_user', as: 'index_diaries_user'
    get 'questions/:id/index_questions_user' => 'questions#index_questions_user', as: 'index_questions_user'
    resources :diaries, only: [:show, :destroy]
    resources :questions, only: [:show, :destroy]
    resources :customers, only: [:show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end