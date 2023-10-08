class V1::BooksSerializer < ActiveModelSerizlizers
    attributes :id, :title, :thumnail, :authors, :pubisher, :review_summary
end