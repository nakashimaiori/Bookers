class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @genres =Genre.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @genres = Genre.all
    @book.genre_id = params[:genre][:name]
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render action: :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
