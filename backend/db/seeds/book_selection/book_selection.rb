puts 'BookSelection START'
# ID 초기값 설정
id = 1

# 2부터 7까지의 Selection에 대해 반복
(1..7).each do |selection_index|
  # Selection을 찾음
  selection = Selection.find_by(id: selection_index)

  # Selection이 존재하는 경우에만 처리
  if selection
    # 각 Selection에 대해 5권의 Book을 맵핑
    (1..6).each do |book_index|
      # Book을 찾음
      book = Book.find_by(id: book_index)

      # Book이 존재하는 경우에만 BookSelection 생성
      if book
        BookSelection.create!(
          id: id,
          book_id: book.id,
          selection_id: selection.id
        )

        # ID 값을 증가
        id += 1
      end
    end
  end
end
puts 'BookSelection END'