class AddRequestTypeToExpedient < ActiveRecord::Migration[7.0]
  def change
    add_column :expedients, :request_type, :string
  end
end
