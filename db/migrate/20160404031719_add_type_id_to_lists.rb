class AddTypeIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :type_id, :integer
  end
end
