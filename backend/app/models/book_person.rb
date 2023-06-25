# frozen_string_literal: true

class book_people < ApplicationRecord
  belongs_to :book
  belongs_to :person
end
