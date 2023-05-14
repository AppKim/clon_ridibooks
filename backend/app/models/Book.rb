class Book < ActiveRecord::Base
  belongs_to :categoris
  belongs_to :publisher
  has_many :peoples
  has_many :review_comments
  has_many :book_selections
  has_one :book_details
end
