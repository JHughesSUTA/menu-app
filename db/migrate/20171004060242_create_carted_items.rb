class CreateCartedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :carted_items do |t|
      t.string :status
      t.integer :user_id
      t.integer :item_id
      t.integer :quantity
      t.integer :order_id

      t.timestamps
    end
  end
end
