class Perfil < ApplicationRecord
    has_many :users
    has_many :expedients

    def isAdmin?
        codigo =="admin"
    end

    def isInv?
        codigo =="inv"
    end
end
