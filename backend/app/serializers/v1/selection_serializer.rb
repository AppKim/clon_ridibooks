class V1::SelectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :selection_type, :books

  def books
    ActiveModel::SerializableResource.new(object.books, each_serializer: V1::BookSerializer)
  end
end