class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :introduction
      t.integer :genre_id
      t.integer :price
      t.string :image_id
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
