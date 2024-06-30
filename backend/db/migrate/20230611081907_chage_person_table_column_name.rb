class ChagePersonTableColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :people, :type, :person_type
  end
end
