class RemoveEmailFromExpedient < ActiveRecord::Migration[7.0]
  def change
    remove_column :expedients, :email, :string
  end
end
