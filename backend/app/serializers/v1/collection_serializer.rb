class V1::CollectionSerializer < ActiveModel::Serializer
    attributes :collection_id, :collection_type, :title, :total_count, :total_page, :size
    has_many :books, each_serializer: V1::BookSerializer
    
    def collection_id
        object.id
    end

    def collection_type
        object.collection_type
    end

    def title
        object.title
    end

    def total_page
        total_count.remainder(size)
    end
    
    def total_count
        object.book_collections.size
    end

    def size
        15
    end
end