class BooksController<ApplicationController

  def index
    @books = Book.alphabetize
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      flash.now[:error] = "Please enter a title an author and image for the book."
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :image)
  end

end
