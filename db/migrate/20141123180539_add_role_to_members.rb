class AddRoleToMembers < ActiveRecord::Migration
  def change
    add_column :members, :role, :string, limit: 6
  end
end
