# frozen_string_literal: true

class Selection < ApplicationRecord
  has_many :books, through: :book_selections
end
