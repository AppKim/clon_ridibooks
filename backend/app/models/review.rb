# frozen_string_literal: true

class Review < ApplicationRecord
  has_many :review_comments
end
