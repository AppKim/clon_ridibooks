class V1::CollectionsController < ApplicationController
    # @todo selecetionテーブルをcollectionに変えた方がいいかも。
    def recent
        recent = Book.recent
        head :not_found and return if recent.blank?
        render json: recent, each_serializer: V1::BookSerializer
    end

    def spotlight
        spotlight_collection = BookCollection.spotlight_collection
        head :not_found and return if spotlight_collection.blank?
        render json: spotlight_collection, serializer: V1::CollectionSerializer
    end
end