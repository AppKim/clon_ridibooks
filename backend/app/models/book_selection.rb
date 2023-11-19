# frozen_string_literal: true

class BookSelection < ApplicationRecord
  belongs_to :book
  belongs_to :selection

  def self.spotlight_sellection
    Selection.spotlight
  end
end
