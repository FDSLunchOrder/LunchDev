class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :account_id
      t.date :date
      t.integer :food_id
      t.string :remark

      t.timestamps null: false
    end
  end
end
