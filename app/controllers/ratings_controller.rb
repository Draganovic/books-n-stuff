class RatingsController < ApplicationController
  before_action :rating_authorize
  def new
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.new
  end

  def create
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.new(rating_params)
        if @rating.save
        redirect_to book_path(@book)
      else
        flash.now[:error] = "Please enter a number between 0 and 5."
        render :new
      end
  end

private

  def rating_params
    params.require(:rating).permit(:score, :book_id)
  end

end
