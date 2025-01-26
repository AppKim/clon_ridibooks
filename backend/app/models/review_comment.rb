# frozen_string_literal: true

class ReviewComment < ApplicationRecord
  belongs_to :review
end
