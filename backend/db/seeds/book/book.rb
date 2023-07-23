# frozen_string_literal: true

puts 'book START'
Book.create!({
    title: '데일 카네기 성공대화론',
    content: '들어가는 말\r\n\r\n1장 두려움이 나가면 용기가 찾아온다\r\n[목소리 훈련]',
    introduction: '지은이 ∥ 데일 카네기 (Dale Carnegie, 1888-1955)\r\n자기계발 분야의 선구자로 손꼽히는 데일 카네기는 1888년 미국 미주리주에서 가난한 농부의 아들로 태어났다.',
    thumnail: 'https://img.ridicdn.net/cover/1883000147/small#1',
    publisher_review: '사람의 마음을 단박에 사로잡고\r\n원하는 대로 이끄는 품격 있는 말하기의 공식\r\n\r\n말이 중요한 시대다.',
    ebook_publish_date: '2022-10-05 00:00:00',
    paper_book_publish_date: '2022-10-05 00:00:00',
    publisher_id: Publisher.all.first.id,
})
puts 'book END'