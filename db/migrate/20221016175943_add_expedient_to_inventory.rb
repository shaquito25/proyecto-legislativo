class AddExpedientToInventory < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :expedient, null: false, foreign_key: true
  end
end
