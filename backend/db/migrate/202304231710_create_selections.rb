class CreateSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :selections do |t|
      t.integer :id, primary_key: true
      t.string :title, limit: 50, null: false, comment: 'セレクションテーマ'
    end
  end
end
