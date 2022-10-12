Rails.application.routes.draw do
  # get 'homes/top'
  # root to: "homes#top"
  devise_for :users
  root 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
