# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_people, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :book_selections, dependent: :destroy
  has_many :book_categories, dependent: :destroy
  has_one :book_detail, dependent: :destroy
  has_many :selections, through: :book_selections
  has_many :person, through: :book_people
  has_many :categories, through: :book_categories
end
