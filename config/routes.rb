Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
  									sessions:      'users/sessions',
                 					passwords:     'users/passwords',
        							registrations: 'users/registrations'
        						  }
  root to: "home#index"

  resources :imageposts, only: [:create, :new, :show] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]


end
