class AddLocationToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :location, :string
    add_column :accounts, :login, :string
    add_column :accounts, :debt, :smallmoney, default: 0
    add_column :accounts, :need_reminder, :boolean, default: 0
    add_column :accounts, :user_gp, :integer, default: 2
  end
end
