class ChangeSpoilerTypeToReviewComments < ActiveRecord::Migration[7.0]
  def change
    change_column :review_comments, :spoiler, :boolean
  end
end
