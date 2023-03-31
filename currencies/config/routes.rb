Rails.application.routes.draw do


  get '/currencies', to: 'currencies#index'
end
