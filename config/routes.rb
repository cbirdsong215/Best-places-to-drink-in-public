Rails.application.routes.draw do
  root 'foods#index'
  devise_for :users
  resources :foods do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index]
    end
  end
end
