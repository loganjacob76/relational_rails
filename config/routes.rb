Rails.application.routes.draw do
  get '/authors', to: 'authors#index'

  get '/bookstores', to: 'bookstores#index'
end
