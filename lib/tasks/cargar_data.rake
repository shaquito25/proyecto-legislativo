namespace :db do
	desc "Contiene la confifuración de Data"

    task cargar_data: :environment do
		cargar_usuarios
	end

    def cargar_usuarios
		u = User.find_by(email:"admin-legislativo@gmail.com")
		if u.nil?
			u = User.new(email:"admin-legislativo@gmail.com", password:"_12a34b56c")
			u.save!
		end
	end
end