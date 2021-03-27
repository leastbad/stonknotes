class RemoveStocktwitsUserNameFrom < ActiveRecord::Migration[6.1]
  def change
    remove_column :stonknotes, :stocktwits_user_name
  end
end
