class AddRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :permissions, :string, array: true, default: []
  end
end
