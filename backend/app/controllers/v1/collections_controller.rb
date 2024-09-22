class V1::CollectionsController < ApplicationController
    # @todo selecetionテーブルをcollectionに変えた方がいいかも。
    def recent
        
    end

    def spotlight
        spotlight_collection = BookCollection.spotlight_collection
        head :not_found and return if spotlight_collection.blank?
        render json: spotlight_collection, serializer: V1::CollectionSerializer
    end
end