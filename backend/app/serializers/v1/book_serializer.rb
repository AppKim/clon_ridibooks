class V1::BookSerializer < ActiveModel::Serializer
    attributes :id, :title, :thumnail, :publisher
    
    def publisher
        object.publisher.name
    end
end