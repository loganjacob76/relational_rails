class BookstoresController < ApplicationController
  def index
    @stores = Bookstore.all
  end

  def show
    @store = Bookstore.find(params[:id])
  end
end
