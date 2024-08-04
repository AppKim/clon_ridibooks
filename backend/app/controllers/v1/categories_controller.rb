# frozen_string_literal: true

class V1::CategoriesController < ApplicationController
    def index
        @categories = Category.all

        render json: @categories, each_serializer: V1::CategoriesSerializer
    end
end
