class AddPerfilRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :perfil, null: false, foreign_key: true
  end
end
