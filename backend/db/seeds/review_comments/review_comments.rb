puts 'review_comments START'
ReviewComment.create!(
    book_id: Book.all.first.id,
    reviewer: 'nah',
    is_buyer: true,
    comment: 'Good Story',
    has_spoiler: true
  )
puts 'review_comments END'