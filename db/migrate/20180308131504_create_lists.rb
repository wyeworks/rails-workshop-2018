class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.references :board, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
