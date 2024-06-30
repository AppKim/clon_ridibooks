# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :book
  has_many :review_comments, dependent: :destroy

  def self.buyer_rating(book)
    buyer_review(book).pluck(:score)
  end

  def self.buyer_review(book)
    book.reviews.filter{ |review| review.is_buyer.eql? true }
  end
end
