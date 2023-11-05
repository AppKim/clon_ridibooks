class RenameReviewTypeToReviewComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :review_comments, :review_type, :is_buyer
  end
end
