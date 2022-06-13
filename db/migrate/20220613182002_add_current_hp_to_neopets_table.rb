class AddCurrentHpToNeopetsTable < ActiveRecord::Migration[5.2]
  def change
    add_column(:neopets, :current_hp_stat, :integer)
  end
end
