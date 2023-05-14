class Category < ApplicationRecord
  # 자기 자신에 대한 참조를 사용하여 계층 관계를 설정
  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
end