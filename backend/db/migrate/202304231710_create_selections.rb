class CreateSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :selections do |t|
      t.string :title, limit: 50, null: false, comment: 'セレクションテーマ'
      t.timestamps :created_at, null: false, comment: 'クリエイト日時'
      t.timestamps :updated_at, null: false, comment: 'アップデート日時'
    end
  end
end
