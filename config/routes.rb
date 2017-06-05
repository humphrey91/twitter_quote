Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'user#create'
  root 'home#index'


end
