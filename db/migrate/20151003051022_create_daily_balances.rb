class CreateDailyBalances < ActiveRecord::Migration
  def change
    create_table :daily_balances do |t|
      t.date :date
      t.float :cal_balance, default: 0
      t.float :adjustment, default: 0
      t.string :remark

      t.timestamps null: false
    end
    add_index :daily_balances, :date, :unique => true
  end
end
