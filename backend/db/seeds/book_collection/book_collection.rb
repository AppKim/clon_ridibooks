puts 'BookCollection START'

collection_id_list = Collection.pluck(:id)
book_id_list = Book.pluck(:id)

book_collections = collection_id_list.product(book_id_list).map do |collection_id, book_id|
  { book_id: book_id, collection_id: collection_id }
end

BookCollection.insert_all(book_collections)

puts 'BookCollection END'
