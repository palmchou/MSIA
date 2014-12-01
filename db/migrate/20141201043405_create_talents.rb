class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :title, null: false, limit: 127
      t.text :content, null: false
      t.timestamps
    end
  end
end
