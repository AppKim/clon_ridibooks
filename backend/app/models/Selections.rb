class Selections < ApplicationRecord
    has_many :books, through: :book_selections
end