class ChangeOrderIndexName < ActiveRecord::Migration
  def change
    add_index :orders, :date, :unique => true
    rename_column :foods, :rest_id, :restaurant_id
  end
end
