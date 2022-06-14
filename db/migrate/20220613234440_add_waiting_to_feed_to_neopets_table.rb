class AddWaitingToFeedToNeopetsTable < ActiveRecord::Migration[5.2]
  def change
    add_column(:neopets, :waiting_to_feed, :boolean, default: false)
  end
end
