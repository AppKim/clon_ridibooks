class V1::BannerSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :link_url
end