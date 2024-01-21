# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :books, through: :book_person

  enum :person_type, %i[author translator]
end
