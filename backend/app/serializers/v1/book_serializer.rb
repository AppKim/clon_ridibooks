class V1::BookSerializer < ActiveModel::Serializer
    attributes :id, :title, :thumnail, :authors, :publisher, :review_summary

    def authors
        BookPerson.authors(object.book_people)
    end
    
    def publisher
        object.publisher.name
    end

    def review_summary
        ActiveModelSerializers::SerializableResource.new(
            object,
            serializer: V1::ReviewSummarySerializer
        )
    end
end