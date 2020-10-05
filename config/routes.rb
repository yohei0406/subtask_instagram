Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
  									sessions:      'users/sessions',
                 					passwords:     'users/passwords',
        							registrations: 'users/registrations'
        						  }
end
