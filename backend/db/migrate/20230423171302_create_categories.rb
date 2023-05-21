class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :depth, default: 0
      t.integer :parent_id

      t.timestamps
    end
  end
end