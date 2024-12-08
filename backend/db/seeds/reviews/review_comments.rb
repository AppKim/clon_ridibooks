puts 'review_comments START'
ReviewComment.create!(
    review_id: Review.first.id,
    content: 'review comment1'
)
ReviewComment.create!(
    review_id: Review.first.id,
    content: 'review comment2'
)
ReviewComment.create!(
    review_id: Review.second.id,
    content: 'review comment3'
)
ReviewComment.create!(
    review_id: Review.second.id,
    content: 'review comment4'
)
puts 'review_comments END'