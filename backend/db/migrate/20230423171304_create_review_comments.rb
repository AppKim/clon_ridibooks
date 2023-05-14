class CreateReviewComments < ActiveRecord::Migration[7.0]
  def change
    create_table :review_comments do |t|
      t.references :book, null: false, foreign_key: true
      t.string :reviewer, null: false
      t.integer :type, default: 0
      t.string :comment, null: false
      t.integer :spoiler, default: 0

      t.timestamps
    end
  end
end