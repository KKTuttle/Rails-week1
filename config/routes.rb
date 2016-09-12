Rails.application.routes.draw do
   root :to => 'words#index'
  resources :words do
    resources :definitions
  end
end
