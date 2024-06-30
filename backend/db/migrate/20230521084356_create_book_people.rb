# frozen_string_literal: true

class CreateBookPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :book_people do |t|
      t.references :book, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.timestamps
    end
  end
end
