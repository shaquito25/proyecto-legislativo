# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    #Correr Seed cada vez que se quiera aumentar la mercancia
    materiales = Inventory.find_by(id: 12)
    if materiales
       materiales.update(med:3000, ct:3000) 
    end 