Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  root "home#index"
  devise_for :users, path: "",
  controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    :registrations => "users/registrations"
  },
  path_names: {
    sign_in: "login", sign_out: "logout", password: "secret",
    confirmation: "verification", unlock: "unblock",
    registration: "register", sign_up: "cmon_let_me_in"
  }

  namespace :admin do
    resources :users
    resources :subjects
    resources :courses do
      resources :lessons
    end
    resources :lessons, only: :get_video do
      post "get_video", on: :collection
    end
    resources :courses_users
    resources :videos
    resources :exercises
  end
  resources :courses
  resources :courses_users
  resources :users
  resources :exercises
  resources :dashboard
end
