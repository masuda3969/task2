class BooksController < ApplicationController
  
  def new
    @book = Book.new
    flash[:notice] = "successfully" 
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    @books = Book.all
    if @book.save
       flash[:notice] = "successfully" 
       redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    flash[:notice] = "successfully"
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @books = Book.all
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
       flash[:notice] = "successfully" 
       redirect_to book_path(@book)
    else
      render :index
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
    flash[:notice] = "successfully" 
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end