class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :review_comment, null: true, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :reviewer, null: false, comment: '作成者'
      t.integer :score, null: false
      t.boolean :is_buyer
      
      t.timestamps
    end
  end
end
