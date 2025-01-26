puts 'reviews START'
Review.create!(
    book_id: Book.first.id,
    reviewer: 'nah',
    score: 3.2,
    is_buyer: true,
    content: 'Review Content',
    has_spoiler: false,
)
Review.create!(
    book_id: Book.first.id,
    reviewer: 'gwak',
    score: 3.5,
    is_buyer: true,
    content: 'Review Content2',
    has_spoiler: true,
)
puts 'reviews END'