# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.integer :type, comment: '0: author 1: translator'
      t.string :name, limit: 50, null: false, comment: '人の名前'
      t.string :introduction, limit: 50, null: false, comment: '人についての紹介'

      t.timestamps
    end
  end
end
