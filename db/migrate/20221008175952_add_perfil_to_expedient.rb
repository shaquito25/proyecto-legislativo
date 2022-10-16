class AddPerfilToExpedient < ActiveRecord::Migration[7.0]
  def change
    add_reference :expedients, :perfil, null: false, foreign_key: true
  end
end
