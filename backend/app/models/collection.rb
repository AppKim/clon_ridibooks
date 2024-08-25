# frozen_string_literal: true

class Collection < ApplicationRecord
  has_many :book_collections
  has_many :books, through: :book_collections

  scope :collection, -> { where(collection_type: 'COLLECTION') }

  def self.spotlight
    find_by(collection_type: 'SPOTLIGHT')
  end
end
