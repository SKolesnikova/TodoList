class RemoveListIdFromTodos < ActiveRecord::Migration[5.0]
  def change
    remove_column :todos, :list_id, :integer
  end
end
