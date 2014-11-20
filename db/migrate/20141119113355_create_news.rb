class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|

      t.timestamps
      t.integer :cate, null: false, limit: 1
      t.string :title, null: false, limit: 127
      t.text :content, null: false
    end
  end
end