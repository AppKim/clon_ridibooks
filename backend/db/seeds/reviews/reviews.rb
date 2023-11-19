puts 'review_comments START'
Review.create!(
    review_comment_id: ReviewComment.all.first.id,
    book_id: Book.all.first.id,
    reviewer: 'nah',
    score: 3.2,
    is_buyer: true
  )
puts 'review_comments END'