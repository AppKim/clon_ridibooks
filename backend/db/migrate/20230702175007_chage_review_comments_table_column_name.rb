class ChageReviewCommentsTableColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :review_comments, :type, :review_type
  end
end
