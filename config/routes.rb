Rails.application.routes.draw do
  get 'posts/index'
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" =>  "posts#show"
  get "/" => "home#top"
  get "about" => "home#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
