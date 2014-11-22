class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|

      t.string :url, null: false, limit: 127
      t.string :title, null: false, limit: 127
    end
  end
end
