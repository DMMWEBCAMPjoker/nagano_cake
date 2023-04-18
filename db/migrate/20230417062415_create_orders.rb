class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,null: false
      t.integer :postage,null: false,default: 800
      t.integer :invoice,null: false
      t.integer :payment_method,null: false,default: 1
      t.string :delivery_postcode,null: false
      t.string :delivery_address,null: false
      t.string :delivery_name,null: false
      t.integer :status,null: false,default: 1
      t.timestamps
    end
  end
end
