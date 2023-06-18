class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy
end
