Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
  									sessions:      'users/sessions',
                 					passwords:     'users/passwords',
        							registrations: 'users/registrations'
        						  }
  root to: "home#index"
  resources :users, only: [:show, :edit, :update]
  resources :imageposts, only: [:create, :new, :show]
end
