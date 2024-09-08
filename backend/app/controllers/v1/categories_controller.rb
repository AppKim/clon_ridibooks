# frozen_string_literal: true

class V1::CategoriesController < ApplicationController
    def index
        @categories = Category.top_level_categories

        render json: @categories, each_serializer: V1::CategoriesSerializer
    end
end
