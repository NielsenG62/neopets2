class AddInventoriesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.string :inv_slot1
      t.string :inv_slot2
      t.string :inv_slot3
      t.string :inv_slot4
      t.integer :user_id
    end
  end
end
