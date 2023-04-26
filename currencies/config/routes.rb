Rails.application.routes.draw do

  root to: 'currencies#index'

  get '/convert', to: 'currencies#convert'
  get '/history', to: 'currencies#history'
end
