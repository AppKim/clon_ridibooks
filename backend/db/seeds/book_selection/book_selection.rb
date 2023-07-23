puts 'BookSelection START'
BookSelection.create!(
  id: 1,
  book_id: Book.all.first.id,
  selection_id: Selection.all.first.id
)
BookSelection.create!(
  id: 2,
  book_id: Book.all.first.id,
  selection_id: Selection.second.id
)
puts 'BookSelection END'