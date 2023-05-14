class CreateBookDetail < ActiveRecord::Migration[7.0]
  def change
    create_table :book_details do |t|
      t.string :format # ファイル形式
      t.integer :size # 電子版の容量
      t.integer :letter_count # 文字数
      t.references :books, null: false, foreign_key: true

      t.timestamps
    end
  end
end
