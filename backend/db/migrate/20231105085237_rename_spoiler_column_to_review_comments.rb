class RenameSpoilerColumnToReviewComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :review_comments, :spoiler, :has_spoiler
  end
end
