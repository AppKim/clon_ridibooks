# frozen_string_literal: true

puts 'book_person START'
BookPerson.create!({
    book_id: Book.all.first.id,
    person_id: Person.all.first.id,
})
puts 'book_person END'
