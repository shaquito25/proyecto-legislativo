class CreateExpedients < ActiveRecord::Migration[7.0]
  def change
    create_table :expedients do |t|
      t.string :name
      t.string :surname
      t.string :person_type
      t.string :age
      t.date :birth_date
      t.integer :request_quantity
      t.string :document
      t.string :email

      t.timestamps
    end
  end
end
