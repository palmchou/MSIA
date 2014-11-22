class CreateMsiaInfos < ActiveRecord::Migration
  def change
    create_table :msia_infos, {
                                :id => false,
                                :primary_key => :slug
                            }do |t|
      t.string :slug, null: false, limit: 10
      t.string :info, null: false, limit: 127
      t.text :content, null: false
    end

    add_index :msia_infos, :slug
  end
end
