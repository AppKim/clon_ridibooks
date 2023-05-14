class CreateBanners < ActiveRecord::Migration[7.0]
  def change
    create_table :banners do |t|
      t.integer :id, primary_key: true
      t.string :image_url, limit: 50, null: false, comment: 'バナーリンク'
      t.string :link_url, limit: 50, null: false, comment: 'セレクションリンク'
      t.string :title, null: false, comment: 'イメージの説明'
    end
  end
end
