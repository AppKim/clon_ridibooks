class Book < ActiveRecord::Base
  belongs_to :publisher
  has_many :peoples
  has_many :review_comments
  has_many :book_selections
  has_many :book_categories
  has_many :categories, through: :book_categories
  has_one :book_detail
end
