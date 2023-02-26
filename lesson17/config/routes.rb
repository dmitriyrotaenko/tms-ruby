Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/jokes/random', to: 'jokes#random'
  get '/jokes/categories', to: 'jokes#categories'
  get '/jokes/search', to: 'jokes#search'
end