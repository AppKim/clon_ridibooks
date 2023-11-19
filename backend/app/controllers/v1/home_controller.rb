class V1::HomeController < ApplicationController
  def index
    render json: serialized_home_data
  end

  private

  def serialized_home_data
    data = { banners: Banner.all, selections: Selection.collection } # TODO:
    V1::HomeSerializer.new(data).as_json
  end
end