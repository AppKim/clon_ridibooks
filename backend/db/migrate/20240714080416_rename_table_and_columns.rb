class RenameTableAndColumns < ActiveRecord::Migration[7.0]
  def change
    rename_table :selections, :collections
    rename_table :book_selections, :book_collections
    rename_column :collections, :selection_type, :collection_type
    rename_column :book_collections, :selection_id, :collection_id
  end
end