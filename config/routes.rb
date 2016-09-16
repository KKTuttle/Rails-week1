Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :words do
      resources :definitions
    end
  end

  root :to => 'home#index'
  get '/user/profile' => "users/profile"
end
