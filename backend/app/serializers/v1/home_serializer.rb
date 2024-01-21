class V1::HomeSerializer < ActiveModel::Serializer
  attribute :banners do
    ActiveModel::SerializableResource.new(
      object[:banners],
      each_serializer: V1::BannerSerializer
    )
  end
  attribute :selections do
    ActiveModel::SerializableResource.new(
      object[:selections],
      each_serializer: V1::SelectionSerializer
    )
  end
end