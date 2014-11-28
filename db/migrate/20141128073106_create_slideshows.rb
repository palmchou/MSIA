class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|
      t.attachment :slide
      t.string :title, limit: 32
      t.string :url, limit: 128
      t.timestamps
    end
  end
end
