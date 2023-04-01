Rails.application.routes.draw do


  get '/currencies', to: 'currencies#index'
  get '/currencies/convert', to: 'currencies#convert'
end
