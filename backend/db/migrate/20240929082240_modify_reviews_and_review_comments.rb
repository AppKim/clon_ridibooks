class ModifyReviewsAndReviewComments < ActiveRecord::Migration[6.1]
  def change
    change_table :reviews do |t|
      remove_foreign_key :reviews, column: :review_comment_id
      remove_index :reviews, :review_comment_id
      t.remove :review_comment_id # 기존의 review_comment_id 필드 삭제
      t.text :content, null: true, comment: "レビュー内容"
      t.boolean :has_spoiler, null: false, default: false
    end
    
    change_table :review_comments do |t|
      t.remove :comment
      t.remove :has_spoiler
      t.bigint :review_id, null: false
      t.text :content, null: false, comment: "コメント内容"
    end

    add_foreign_key :review_comments, :reviews, column: :review_id
  end
end