class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id', optional: true

  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  has_many :book_categories
  has_many :books, through: :book_categories
end