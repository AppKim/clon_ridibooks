class AddSelectionTypeToSelections < ActiveRecord::Migration[7.0]
  def change
    add_column :selections, :selection_type, :string
  end
end
