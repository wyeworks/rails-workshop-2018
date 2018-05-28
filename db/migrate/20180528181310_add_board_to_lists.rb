class AddBoardToLists < ActiveRecord::Migration[5.1]
  def change
    add_reference :lists, :board, foreign_key: true
  end
end
