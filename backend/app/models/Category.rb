# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true

  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  has_many :book_categories, dependent: :destroy
  has_many :books, through: :book_categories
end
