class ChangeTask < ActiveRecord::Migration
  def change
    change_column_default :tasks, :complete, false
    change_column_null :tasks, :complete, false
  end
end
