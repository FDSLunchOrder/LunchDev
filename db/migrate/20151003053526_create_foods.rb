class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :rest_id
      t.string :name
      t.string :name2
      t.boolean :active, default: 1
      t.float :price, null: false

      t.timestamps null: false
    end
  end
end
