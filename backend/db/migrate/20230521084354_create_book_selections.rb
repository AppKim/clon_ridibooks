# frozen_string_literal: true

class CreateBookSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :book_selections do |t|
      t.references :book, null: false, foreign_key: true
      t.references :selection, null: false, foreign_key: true
      t.timestamps
    end
  end
end
