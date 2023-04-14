Rails.application.routes.draw do
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   # Defines the root path route ("/")
   root "users#index"
   # devise_for :users

   resources :users, only: [:index, :show] do
      resources :posts, only:[:index, :show, :new, :create, :destroy] do
         resources :comments, only:[:index, :new, :create, :destroy]
         resources :likes, only:[:create]
      end
   end

   namespace :api do
      namespace :v1 do
         resources :users, only: [:index, :show] do
            resources :posts, only:[:index, :show, :new, :create, :destroy] do
               resources :comments, only:[:index, :new, :create, :destroy]
            end
         end
      end
   end
end
