Rails.application.routes.draw do
  get '/authors', to: 'authors#index'
  
  get '/authors/:id', to: 'authors#show'
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/authors/:id/books', to: 'authors#relationship'

  get '/bookstores', to: 'bookstores#index'
  get '/bookstores/new', to: 'bookstores#new'
  get '/bookstores/:id', to: 'bookstores#show'
  get '/bookstores/:id/edit', to: 'bookstores#edit'
  post '/bookstores', to: 'bookstores#create'
  patch '/bookstores/:id', to: 'bookstores#update'

  get '/bookstores/:id/employees', to: 'bookstores#relationship'
  get '/bookstores/:id/employees/new', to: 'employees#new'
  post '/bookstores/:bookstore_id/employees', to: 'employees#create'
  patch '/bookstores/:id/employees', to: 'bookstores#alpha'

  get '/employees', to: 'employees#index'
  get '/employees/:id', to: 'employees#show'
  get '/employees/:id/edit', to: 'employees#edit'
  patch '/employees/:id', to: 'employees#update'
end
