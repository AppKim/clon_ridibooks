# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :books, through: :book_person
end
