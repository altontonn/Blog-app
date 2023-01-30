Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#index"

  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:user_id/posts", to: "users#post"
  get "/users/:user_id/posts/:id", to: "users#show_post"
end
