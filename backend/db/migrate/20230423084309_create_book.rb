class CreateBook < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, index: true
      t.string :content, comment: "目次"
      t.string :introduction, comment: "紹介文"
      t.string :thumnail
      t.string :publisher_review, comment: "出版社レビュー"
      t.date :ebook_publish_date, comment: "電子版公開日"
      t.date :paper_book_publish_date, comment: "紙版公開日"
      t.references :publisher, null: false, foreign_key: true
      t.timestamps
    end
  end
end
