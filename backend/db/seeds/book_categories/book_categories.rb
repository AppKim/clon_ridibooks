puts 'book_categories START'
BookCategory.create!(
    book_id: Book.all.first.id,
    category_id: 1
  )
puts 'book_categories END'