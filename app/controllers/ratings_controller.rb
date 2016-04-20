class RatingsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.new
  end

  def create
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.new(rating_params)
    check_rating_input(@rating)
      if @rating.score.between?(0, 5)
        if @rating.save
        redirect_to book_path(@book)
        end
      else
        render :new
      end
  end

private

  def rating_params
    params.require(:rating).permit(:score, :book_id)
  end

  def check_rating_input(rating)
    if rating.score > 5 || rating.score < 0
      flash.now[:error] = "Please enter a number between 0 and 5."
    end
  end

end
