class CreatePeoples < ActiveRecord::Migration[7.0]
  def change
    create_table :peoples do |t|
      t.integer :type, comment: '0: author 1: translator'
      t.string :name, limit: 50, null: false, comment: '人の名前'
      t.string :introduction, limit: 50, null: false, comment: '人についての紹介'
      t.timestamps :created_at, null: false, comment: 'クリエイト日時'
      t.timestamps :updated_at, null: false, comment: 'アップデート日時'
    end
  end
end
