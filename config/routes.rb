Rails.application.routes.draw do
  root 'home#show'
  devise_for :users


  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index]
    end
  end
end
