class BooksController < ApplicationController
    def index
        @list = Book.book_list
        render json: @list, serializer: BookSerializer
    end
    
    def show

    end

    def bestseller

    end
end