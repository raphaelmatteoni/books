class BooksController < ApplicationController
    before_action :not_found_error, only: [:update, :destroy, :show]

    def index
        @books = Book.all

        render :json => @books
    end

    def show

        render :json => @book
    end

    def create
        book = Book.create(book_params)

        render :json => book
    end

    def update
        @book.update(book_params)

        render :json => @book
    end

    def destroy
        @book.destroy

        render :json => { message: "Book deleted successfully" }
    end

    private

    def not_found_error
        @book = Book.find(params[:id])

        raise ActiveRecord::RecordNotFound
        
        render :json => { error: "Book not found" }, status: :not_found
    end

    def book_params
        params.require(:book).permit(:title, :author, :publication_year)
    end

end
