class BooksController < ApplicationController
  def index
    @books = Book.all
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
    redirect_to "/books/#{book.id}"
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end
end
