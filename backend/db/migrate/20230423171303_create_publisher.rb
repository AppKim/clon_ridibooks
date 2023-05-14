class CreatePublisher < ActiveRecord::Migration[7.0]
  def change
    create_table :tables do |t|
      t.string :name

      t.timestamps
    end
  end
end
