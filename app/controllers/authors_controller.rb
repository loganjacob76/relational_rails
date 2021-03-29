class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order(:created_at)
  end

  def new
  end

  def create
    # Author.create(author_params)
    @author = Author.create(name: params[:name], best_selling_author: params[:best_selling_author], year_first_published: params[:year_first_published])
    redirect_to '/authors'
  end

  # private
  # def author_params
  #   params.permit(:name, :best_selling_author, :year_first_published)
  # end

  def show
    @author = Author.find(params[:id])
  end

  def relationship
    @authors_books = Author.find(params[:id]).books
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
