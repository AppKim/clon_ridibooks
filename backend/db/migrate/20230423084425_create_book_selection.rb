class CreateBookSelection < ActiveRecord::Migration[7.0]
  def change
    create_table :book_selections do |t|
      t.references :books, null: false, foreign_key: true
      t.references :selections, null: false, foreign_key: true
      t.timestamps
    end
  end
end
