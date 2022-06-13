class AddNeopetsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :neopets do |t|
      t.string :pet_name
      t.integer :att_stat
      t.integer :def_stat
      t.integer :spd_stat
      t.integer :hp_stat
      t.boolean :pet_hungry, default: true
      t.string :pet_pic
      t.integer :user_id
    end
  end
end
