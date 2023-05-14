class CreateBanners < ActiveRecord::Migration[7.0]
  def change
    create_table :banners do |t|
      t.string :image_url, limit: 50, comment: 'バナーリンク'
      t.string :link_url, limit: 50, comment: 'セレクションリンク'
      t.string :title, null: false, comment: 'イメージの説明'
      t.timestamps :created_at, null: false, comment: 'クリエイト日時'
      t.timestamps :updated_at, null: false, comment: 'アップデート日時'
    end
  end
end
