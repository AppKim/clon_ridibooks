class CreateBookPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :book_people do |t|
      t.references :books, null: false, foreign_key: true
      t.references :peoples, null: false, foreign_key: true
      t.timestamps
    end
  end
end
