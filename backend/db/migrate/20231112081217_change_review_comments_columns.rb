class ChangeReviewCommentsColumns < ActiveRecord::Migration[7.0]
  def change
    remove_columns :review_comments, :reviewer, :is_buyer
    remove_reference :review_comments, :book
  end
end
