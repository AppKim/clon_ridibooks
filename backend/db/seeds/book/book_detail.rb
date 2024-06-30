# frozen_string_literal: true

puts 'book_detail START'
BookDetail.create!({
    book_id: Book.all.first.id,
    format: 'epub',
    size: 15575,
    letter_count: 126163
})
puts 'book_detail END'
