class CreateBookPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :book_peoples do |t|
      t.references :book, null: false, foreign_key: true
      t.references :people, null: false, foreign_key: true
      t.timestamps
    end
  end
end
