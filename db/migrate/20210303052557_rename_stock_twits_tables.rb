class RenameStockTwitsTables < ActiveRecord::Migration[6.1]
  def change
    rename_table :stocktwit_hashtags, :stonknote_hashtags
    rename_table :stocktwit_tickers, :stonknote_tickers
    rename_table :stocktwit_watch_tickers, :stonknote_watch_tickers
    rename_table :stocktwits, :stonknotes
  end
end
