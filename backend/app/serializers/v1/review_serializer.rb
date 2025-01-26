class V1::ReviewSerializer < ActiveModel::Serializer
  attributes :id, :book_id, :reviewer, :score, :is_buyer, :created_at, :updated_at, :content, :has_spoiler

  has_many :review_comments, serializer: V1::ReviewCommentSerializer, key: :comments
end