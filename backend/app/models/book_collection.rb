# frozen_string_literal: true

class BookCollection < ApplicationRecord
  belongs_to :book
  belongs_to :collection

  def self.spotlight_collection
    Collection.spotlight
  end
end