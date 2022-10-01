class CreatePerfils < ActiveRecord::Migration[7.0]
  def change
    create_table :perfils do |t|
      t.string :nombre
      t.string :codigo

      t.timestamps
    end
  end
end
