class CreatePeoples < ActiveRecord::Migration[7.0]
  def change
    create_table :peoples do |t|
      t.integer :id, primary_key: true
      t.integer :type, null: true, comment: '0: author 1: translator'
      t.string :name, limit: 50, null: false, comment: '人の名前'
      t.string :introduction, limit: 50, null: false, comment: '人についての紹介'
    end
  end
end
