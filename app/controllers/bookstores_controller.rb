class BookstoresController < ApplicationController
  def index
    @stores = Bookstore.order_by_creation
  end

  def show
    @store = Bookstore.find(params[:id])
  end

  def relationship
    @store = Bookstore.find(params[:id])
  end
end
