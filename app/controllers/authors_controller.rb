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
  end

  def edit
   @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(name: params[:name], best_selling_author: params[:best_selling_author], year_first_published: params[:year_first_published])
    redirect_to "/authors/#{author.id}"
  end

  def alpha
    @author = Author.find(params[:author_id])
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to '/authors'
  end
end
