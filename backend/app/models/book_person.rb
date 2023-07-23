# frozen_string_literal: true

class BookPerson < ApplicationRecord
  belongs_to :book
  belongs_to :person
end
