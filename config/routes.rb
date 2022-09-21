Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#hotels'
  resources :hotels do
    resources :bookings, except: [:destroy]
  end
end
