class V1::CategoriesSerializer < ActiveModel::Serializer
    attributes :id, :name, :children, :books_count
  
    has_many :children, serializer: V1::CategoriesSerializer
    has_many :books, serializer: V1::BookSerializer
  
    def books_count
      object.books.size
    end
end