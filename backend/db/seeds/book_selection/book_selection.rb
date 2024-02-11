puts 'BookSelection START'

selection_id_list = Selection.pluck(:id)
book_id_list = Book.pluck(:id)

book_selections = selection_id_list.product(book_id_list).map do |selection_id, book_id|
  { book_id: book_id, selection_id: selection_id }
end

BookSelection.insert_all(book_selections)

puts 'BookSelection END'
