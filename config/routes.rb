Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
  									    sessions:      'users/sessions',
                 			 passwords:     'users/passwords',
        					 registrations: 'users/registrations'}

  resources :users do
    member do
      get :following, :followers
    end
  end

  get "users/:id/likes" => "users#likes"


  root to: "home#index"

  resources :imageposts, only: [:create, :new, :show] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update]

  resources :relationships, only: [:create, :destroy]


end
