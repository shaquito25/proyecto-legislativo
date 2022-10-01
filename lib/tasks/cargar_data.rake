namespace :db do
	desc "Carga de Usuarios y Perfiles Para la Plataforma."

    task cargar_data: :environment do
		cargar_usuarios
		cargar_perfiles
	end

    def cargar_usuarios
		u = User.find_by(email:"admin-legislativo@gmail.com")
		u2 = User.find_by(email:"inv-legislativo@gmail.com")
		if u.nil? && u2.nil?
			u = User.new(email:"admin-legislativo@gmail.com", password:"_12a34b56c", perfil_id:1)
			u.save!
			u = User.new(email:"inv-legislativo@gmail.com", password:"_12a34b56c", perfil_id:2)
			u.save!
		end
	end

	def cargar_perfiles
		perfil_administrador = Perfil.find_by(nombre:"Administrador")
		perfil_inventario = Perfil.find_by(nombre:"Inventario")
		if perfil_administrador.nil? && perfil_inventario.nil?
		   	perfil_administrador = Perfil.new(nombre:"Administrador", codigo:"admin")
			   perfil_administrador.save!
			perfil_inventario = Perfil.new(nombre:"Inventario", codigo:"inv")
				perfil_inventario.save!
		end
	end
end