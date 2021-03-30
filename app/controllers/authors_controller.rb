class AuthorsController < ApplicationController
  def index
    @authors = Author.order_by_created_at
  end

  def new
  end

  def create
    @author = Author.create(name: params[:name], best_selling_author: params[:best_selling_author], year_first_published: params[:year_first_published])
    redirect_to '/authors'
  end

  def show
    @author = Author.find(params[:id])
  end

  def relationship
    @author = Author.find(params[:id])
    # @authors_books = Author.find(params[:id]).books
    # @authors_books = Author.find(params[:id]).books.order(:name)
  end

  def edit
   @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(name: params[:name], best_selling_author: params[:best_selling_author], year_first_published: params[:year_first_published])
    redirect_to "/authors/#{author.id}"
  end
end
