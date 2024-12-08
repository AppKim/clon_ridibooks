puts 'ReviewComments seeding START'

review_comments = {
    Review.first => [
        'review comment1',
        'review comment2'
    ],
    Review.second => [
        'review comment3',
        'review comment4'
    ]
}

review_comments.each do |review, comments|
    comments.each do |content|
        ReviewComment.create!(
            review_id: review.id,
            content: content
        )
    end
end

puts 'ReviewComments seeding END'