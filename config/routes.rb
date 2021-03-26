Rails.application.routes.draw do
  get '/authors', to: 'authors#index'
  
  get '/authors/:id', to: 'authors#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/authors/:id/books', to: 'authors#relationship'

  get '/bookstores', to: 'bookstores#index'
  get '/bookstores/:id', to: 'bookstores#show'
  get '/bookstores/:id/employees', to: 'bookstores#relationship'

  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'
end
