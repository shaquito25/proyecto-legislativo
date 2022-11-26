class RemoveAgeFromExpedient < ActiveRecord::Migration[7.0]
  def change
    remove_column :expedients, :age, :string
  end
end
