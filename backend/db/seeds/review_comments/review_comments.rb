puts 'review_comments START'
ReviewComment.create!(
    book_id: Book.all.first.id,
    reviewer: 'nah',
    review_type: 0,
    comment: 'Good Story',
    spoiler: 0
  )
puts 'review_comments END'