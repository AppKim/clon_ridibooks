class V1::BookCategorySerializer < ActiveModel::Serializer
    attributes :category_id

    def category_id
        object.category_id
    end
end