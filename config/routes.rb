Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'user#create'
  root 'home#index'

  resources :user do
    member do
      put :unsubscribe
    end
  end

end
