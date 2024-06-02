class V1::SpotlightsController < ApplicationController
  def index
    head :not_found and return if BookSelection.spotlight_sellection.blank?
<<<<<<< HEAD
    render json: BookSelection.spotlight_sellection, each_serializer: V1::SpotlightSerializer
=======
    render json: BookSelection.spotlight_sellection, serializer: V1::SpotlightSerializer
>>>>>>> fcef1a4 (backendと繋ぎ込み(spotlight))
  end
end