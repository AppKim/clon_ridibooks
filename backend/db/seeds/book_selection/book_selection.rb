puts 'BookSelection START'
BookSelection.create!(
  id: 1,
  book_id: Book.first.id,
  selection_id: Selection.first.id
)
BookSelection.create!(
  id: 2,
  book_id: Book.second.id,
  selection_id: Selection.second.id
)
puts 'BookSelection END'