puts 'BookSelection START'
unless BookSelection.find_by(id: 1)
  BookSelection.create!(
    id: 1,
    book_id: Book.first.id,
    selection_id: Selection.first.id
  )
end
unless BookSelection.find_by(id: 2)
  BookSelection.create!(
    id: 2,
    book_id: Book.second.id,
    selection_id: Selection.second.id
  )
end
puts 'BookSelection END'


