class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order(:created_at)
  end

  def show
    @author = Author.find(params[:id])
  end

  def relationship
    @authors_books = Author.find(params[:id]).books
  end
end
