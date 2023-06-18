class Book < ApplicationRecord
  belongs_to :publisher
  has_many :people, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :book_selections, dependent: :destroy
  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories
  has_one :book_detail, dependent: :destroy
end
