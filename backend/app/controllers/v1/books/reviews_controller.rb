module V1
  module Books
    class ReviewsController < ApplicationController
      def index
        book_id = params[:book_id]
        reviews = Review.reviews_with_comments_by_book(book_id)
        serialized_reviews = ActiveModelSerializers::SerializableResource.new(reviews, each_serializer: ReviewSerializer).as_json
        render json: serialized_reviews
      end
      
      private
    end
  end
end