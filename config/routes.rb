Rails.application.routes.draw do
  get '/authors', to: 'authors#index'

  get '/bookstores', to: 'bookstores#index'
  get '/bookstores/:id', to: 'bookstores#show'

  get '/employees', to: 'employees#index'
end
