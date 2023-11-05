class V1::SpotlightsController < ApplicationController
  def index
    render json: BookSelection.spotlight_sellection, serializer: V1::SpotlightSerializer
  end
end