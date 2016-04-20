class RatingsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.new
  end

  def create
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.create(rating_params)
      if @rating.save
        redirect_to book_path(@book)
      else
        flash
      end

  end

private

  def rating_params
    params.require(:rating).permit(:score, :book_id)
  end

end
