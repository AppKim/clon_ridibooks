# frozen_string_literal: true

class ReviewComment < ApplicationRecord
  scope :buyer, -> { where(is_buyer: true) }
end
