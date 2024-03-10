class V1::SpotlightsController < ApplicationController
  def index
    head :not_found and return if BookSelection.spotlight_sellection.blank?
    render json: BookSelection.spotlight_sellection, each_serializer: V1::SpotlightSerializer
  end
end