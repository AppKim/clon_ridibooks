class V1::SpotlightsController < ApplicationController
  def index
    head :not_found and return if BookCollection.spotlight_collection.blank?
    render json: BookCollection.spotlight_collection, each_serializer: V1::SpotlightSerializer
  end
end