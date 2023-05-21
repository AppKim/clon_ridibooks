class CreateBookCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :book_categories do |t|
      t.integer :book_id
      t.integer :category_id

      t.timestamps
    end

    add_foreign_key :book_categories, :books
    add_foreign_key :book_categories, :categories
  end
end