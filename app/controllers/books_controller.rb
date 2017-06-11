class BooksController < ApplicationController
  before_action :require_user

  def index
    @books = Book.where('user_id = ?', current_user.id)

    if params[:genre] and params[:genre] != 'Все'
      @books = @books.where('genre = ?', params[:genre])
      @genre = params[:genre]
    end

    if params[:name]
      @books = @books.where('name LIKE ?', params[:name])
    end

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = User.find_by_nick(current_user.nick).id

    if @book.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to '/'
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  private
  def book_params
    params.require(:book).permit(:name, :author, :note, :genre, :img)
  end

end
