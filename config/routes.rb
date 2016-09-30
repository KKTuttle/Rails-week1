Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do
    resources :words do
      resources :definitions
    end
  end

  root :to => 'home#index'
  # get '/user/profile' => "users/show"

end
