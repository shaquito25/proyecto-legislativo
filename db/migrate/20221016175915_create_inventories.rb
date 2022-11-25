class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.integer :medicine_quantity
      t.integer :construction_quantity
      t.integer :total_quantity

      t.timestamps
    end
  end
end
