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

  def new
  end

  def create
    store = Bookstore.new({
      name: params[:bookstore][:name],
      has_coffee_shop: params[:bookstore][:has_coffee_shop] ? true : false,
      days_open_per_week: params[:bookstore][:days_open_per_week]
    })
    store.save
    redirect_to '/bookstores'
  end
end
