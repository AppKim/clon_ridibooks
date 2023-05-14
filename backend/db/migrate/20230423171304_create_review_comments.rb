class CreateReviewComments < ActiveRecord::Migration[7.0]
  def change
    create_table :review_comments do |t|
      t.references :book, null: false, foreign_key: true
      t.string :reviewer
      t.integer :type
      t.string :comment
      t.integer :spoiler

      t.timestamps
    end
  end
end