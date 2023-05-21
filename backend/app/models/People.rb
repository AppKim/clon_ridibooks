class Peoples < ApplicationRecord
    has_many :books, through: :book_peoples
end