class ChangeReviewTypeToReviewComments < ActiveRecord::Migration[7.0]
  def change
    change_column :review_comments, :review_type, :boolean
  end
end
