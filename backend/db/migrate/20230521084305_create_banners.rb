# frozen_string_literal: true

class CreateBanners < ActiveRecord::Migration[7.0]
  def change
    create_table :banners do |t|
      t.string :image_url, limit: 50, comment: 'バナーリンク'
      t.string :link_url, limit: 50, comment: 'セレクションリンク'
      t.string :title, null: false, comment: 'イメージの説明'

      t.timestamps
    end
  end
end
