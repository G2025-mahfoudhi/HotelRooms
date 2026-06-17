Rails.application.routes.draw do
  devise_for :users

  resources :hotels, only: [:index, :show] do
    resources :reviews, only: [:create]
    resources :rooms, only: [:show] do
      resources :bookings, only: [:new, :create]
    end
  end

  resources :bookings, only: [:index]

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "hotels#index"
end
