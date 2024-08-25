class V1::HomeSerializer < ActiveModel::Serializer
  attribute :banners do
    ActiveModelSerializers::SerializableResource.new(
      object[:banners],
      each_serializer: V1::BannerSerializer
    )
  end
  attribute :collections do
    ActiveModelSerializers::SerializableResource.new(
      object[:collections],
      each_serializer: V1::CollectionSerializer
    )
  end
end