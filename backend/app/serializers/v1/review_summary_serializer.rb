class V1::ReviewSummarySerializer < ActiveModel::Serializer
    attributes :buyer_rating_distribution, :buyer_rating_average, :buyer_rating_count, :buyer_review_count, :total_rating_count, :total_review_count

    def buyer_rating_distribution
        []
    end

    def buyer_rating_average
        Review.buyer_rating(object).sum(0.0)
    end

    def buyer_rating_count
        Review.buyer_rating(object).size
    end

    def buyer_review_count
        Review.buyer_review(object).size
    end

    def total_rating_count
        object.reviews.pluck(:score).sum(0.0)
    end

    def total_review_count
        object.reviews.size
    end
end