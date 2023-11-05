class V1::BookSerializer < ActiveModel::Serializer
    attributes :id, :title, :thumnail, :authors, :publisher

    def authors
        BookPerson.authors(object.book_people)
    end
    
    def publisher
        object.publisher.name
    end
end