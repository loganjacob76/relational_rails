class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    @book = Book.create(name: params[:name], fiction: params[:fiction], number_of_pages: params[:number_of_pages], author_id: params[:author_id])
    redirect_to '/authors/:id/books'
  end
end
