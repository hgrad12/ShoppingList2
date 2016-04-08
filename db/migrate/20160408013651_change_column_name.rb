class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :lists, :type, :listName
  end
end
