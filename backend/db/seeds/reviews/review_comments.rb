puts 'review_comments START'
ReviewComment.create!(
    comment: 'Good Story',
    has_spoiler: true
  )
puts 'review_comments END'