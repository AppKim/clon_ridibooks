class V1::ReviewSummarySerializer < ActiveModel::Serializer
    attributes 
    :buyer_rating_distribution,
    :buyer_rating_average, 
    :buyer_rating_count,
    :buyer_review_count,
    :total_review_count,
    :total_review_count,

    def buyer_rating_distribution
        []
    end

    def buyer_rating_average
        object.buyer
    end

    def buyer_review_count
        object
    end
end