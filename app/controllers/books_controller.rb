class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_book, only: [:edit, :update]
  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@book.id)
      else
      @books = Book.all
      @user = current_user
      render :index
      end
  end

  def index
      @books = Book.all.reverse_order
      @book = Book.new
      @user = current_user
  end

  def show
      @book = Book.find(params[:id])
      @bookn = Book.new
      @user = @book.user
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book.id)
      else
      render :edit
    end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
      flash[:success] = "Book was successfully destroyed."
  end




  private
    def book_params
        params.require(:book).permit(:title, :book_body)
    end

    def correct_book
      @book = Book.find(params[:id])
    if @book.user_id != current_user.id
       redirect_to books_path
    end
  end

end
