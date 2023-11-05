# frozen_string_literal: true

class BookPerson < ApplicationRecord
  belongs_to :book
  belongs_to :person

  def self.authors(book_people)
    authors = {}
    book_people.each do | book_person |      
      authors[book_person.person.person_type] ||= []
      person = {
        id: book_person.person.id,
        name: book_person.person.name
      }
      authors[book_person.person.person_type] << person
    end
    authors
  end

end
