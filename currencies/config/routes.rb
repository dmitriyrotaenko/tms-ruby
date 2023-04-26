Rails.application.routes.draw do


  # resources :currencies do
    # get :currencies

  get '/currencies', to: 'currencies#index'
  get '/currencies/convert', to: 'currencies#convert'
  get '/currencies/history', to: 'currencies#history'
  # end
end
