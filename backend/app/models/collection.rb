# frozen_string_literal: true

class Selection < ApplicationRecord
  has_many :book_collections
  has_many :books, through: :book_collections

  scope :spotlight, -> { find_by(selection_type: 'SPOTLIGHT') }
  scope :collection, -> { where(selection_type: 'COLLECTION') }
end
