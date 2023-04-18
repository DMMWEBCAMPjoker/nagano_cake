class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.text :description, null: false
      t.integer :genre_id, null: false
      t.integer :price, null: false
      t.boolean :is_deleted, default: false, null: false


      t.timestamps
    end
  end
end
