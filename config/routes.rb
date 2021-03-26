Rails.application.routes.draw do
  get '/authors', to: 'authors#index'

  get '/bookstores', to: 'bookstores#index'
  get '/bookstores/:id', to: 'bookstores#show'
  get '/bookstores/:id/employees', to: 'bookstores#relationship'

  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'
end
