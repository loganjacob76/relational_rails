Rails.application.routes.draw do
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'
  get '/authors/:id/books', to: 'authors#relationship'
  get '/authors/:id/books/new', to: 'books#new'
  post '/authors/:author_id/books', to: 'books#create'
  patch '/authors/:author_id/books', to: 'authors#alpha'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'

  get '/bookstores', to: 'bookstores#index'
  get '/bookstores/new', to: 'bookstores#new'
  get '/bookstores/:id', to: 'bookstores#show'
  get '/bookstores/:id/edit', to: 'bookstores#edit'
  post '/bookstores', to: 'bookstores#create'
  patch '/bookstores/:id', to: 'bookstores#update'
  delete '/bookstores/:id', to: 'bookstores#destroy'

  get '/bookstores/:id/employees', to: 'bookstores#relationship'
  get '/bookstores/:id/employees/new', to: 'employees#new'
  post '/bookstores/:bookstore_id/employees', to: 'employees#create'
  patch '/bookstores/:id/employees', to: 'bookstores#alpha'

  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'
  get '/employees/:id/edit', to: 'employees#edit'
  patch '/employees/:id', to: 'employees#update'
  delete '/employees/:id', to: 'employees#destroy'
end
