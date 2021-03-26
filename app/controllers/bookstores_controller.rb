class BookstoresController < ApplicationController
  def index
    @stores = Bookstore.all
  end

  def show
    @store = Bookstore.find(params[:id])
  end

  def relationship
    @store = Bookstore.find(params[:id])
  end
end
