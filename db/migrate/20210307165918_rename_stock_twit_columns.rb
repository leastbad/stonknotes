class RenameStockTwitColumns < ActiveRecord::Migration[6.1]
  def change
    rename_column :stonknotes, :stocktwit_time, :stonknote_time
    rename_column :stonknotes, :stocktwit_date, :stonknote_date
    rename_column :stonknote_hashtags, :stocktwit_id, :stonknote_id
    rename_column :stonknote_tickers, :stocktwit_id, :stonknote_id
    rename_column :tweets, :stocktwit_id, :stonknote_id
  end
end
