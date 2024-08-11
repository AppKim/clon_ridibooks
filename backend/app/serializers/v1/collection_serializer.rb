class V1::CollectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :collection_type, :books, :test

  def test
    'test'
  end

  def books
    ActiveModel::SerializableResource.new(object.books, each_serializer: V1::BookSerializer)
  end
end