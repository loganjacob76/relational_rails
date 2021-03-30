class BooksController < ApplicationController
  def index
    @books = Book.all
    # @books = Book.where(fiction: true)
    # @books = Book.only_fiction
  end

  def new
    @author = Author.find(params[:id])
  end

  def create
    @book = Book.create!(name: params[:name], fiction: params[:fiction], number_of_pages: params[:number_of_pages], author_id: params[:author_id])
    redirect_to "/authors/#{@book.author_id}/books"
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(name: params[:name], fiction: params[:fiction], number_of_pages: params[:number_of_pages])
    # book.update(name: params[:name], fiction: params[:fiction], number_of_pages: params[:number_of_pages], author_id: params[:author_id])
    redirect_to "/books/#{book.id}"
  end
end
