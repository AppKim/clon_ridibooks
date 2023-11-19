class V1::SpotlightsController < ApplicationController
  def index
    head :not_found if BookSelection.spotlight_sellection.blank?
    render json: BookSelection.spotlight_sellection, serializer: V1::SpotlightSerializer
  end
end