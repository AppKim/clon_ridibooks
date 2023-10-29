class V1::SpotlightsSerializer < ActiveModel::Serializer
    attributes :collection_id, :type, :title, :total_count, :total_page, :size
    attribute :books do
        ActiveModelSerizlizers::SerializableResource.new(
            object.books,
            serializer: V1::BooksSerializer
        )
    end
    
    def collection_id
        0
    end

    def type
        'SPOTLIGHT'
    end

    def title
        '이번 주 입고 도서'
    end

    def total_count
        object.books.size
    end

    def size
        object.books.size
    end
end