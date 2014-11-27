class AddMoreInfoToMembers < ActiveRecord::Migration
  def change
    add_column :members, :member_name, :string, null: false, limit: 10
    add_column :members, :brief, :string, limit: 64
    add_column :members, :phone_number, :string, null: false, limit: 11
    add_column :members, :address, :string, null: false, limit: 64
    add_column :members, :show, :boolean, null: false, default: false
  end
end