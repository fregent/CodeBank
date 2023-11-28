class BooksController < ApplicationController

  def index
    @snippets = Snippet.all
    @snippet = Snippet.new
    @user = current_user
    @user_snippets = current_user.snippets
  end

  def new
    @snippet = Snippet.new
    @user = current_user
  end

  def create
    @snippet = Snippet.new(params_snippet)
    @snippet.user = current_user
    if @snippet.save
      redirect_to root_path(@snippet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @snippet = Snippet.find(params[:id])
    @user = current_user
    @user_book = @book.user
    @reservation = Reservation.new
    @review = Review.new
    @reviews = @book.reviews
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def update
    @book = Book.find(params[:id])
    @user = current_user
    @book.update(params_book)
    redirect_to root_path
  end

  def destroy
    @book = Book.find(params[:id])
    @user = current_user
    @user_destroyer = @book.user
    @book.destroy

    if @user == @user_destroyer
      @book.destroy
      flash[:notice] = "Book supprimée avec succès."
    end
    redirect_to my_books_path

  end

  private

  def params_book
    params.require(:book).permit(:title, :author, :published_year, :reservation_price, :description)
  end
end
