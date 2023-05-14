class CreateSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :selections do |t|
      t.string :title, limit: 50, null: false, comment: 'セレクションテーマ'
      
      t.timestamps
    end
  end
end
