class BookstoresController < ApplicationController
  def index
    @stores = Bookstore.all
  end
end
