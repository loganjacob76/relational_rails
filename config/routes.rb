Rails.application.routes.draw do
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'
  get '/authors/:id/books', to: 'authors#relationship'
  get '/authors/:id/books/new', to: 'books#new'
  post '/books', to: 'books#create'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'

  get '/bookstores', to: 'bookstores#index'
  get '/bookstores/:id', to: 'bookstores#show'
  get '/bookstores/:id/employees', to: 'bookstores#relationship'

  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'
end
