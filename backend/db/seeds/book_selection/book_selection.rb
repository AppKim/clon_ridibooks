puts 'BookSelection START'

Selection.find_each do |selection|
  Book.find_each do |book|
    BookSelection.create!(
      book_id: book.id,
      selection_id: selection.id
    )
  end
end

puts 'BookSelection END'