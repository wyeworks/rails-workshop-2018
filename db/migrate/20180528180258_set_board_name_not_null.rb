class SetBoardNameNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :boards, :name, false
  end
end
